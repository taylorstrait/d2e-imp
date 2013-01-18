class RelationshipValidator < ActiveModel::EachValidator
  CHECKS = { :is => :==, :minimum => :>=, :maximum => :<= }.freeze
  MESSAGES = { :is => :equal_to, :minimum => :greater_than_or_equal_to, :maximum => :less_than_or_equal_to }.freeze
  RESERVED_OPTIONS = [:minimum, :maximum, :within, :is, :greater_than_or_equal_to, :less_than_or_equal_to]

  def initialize(options)
    if range = (options.delete(:in) || options.delete(:within))
      raise ArgumentError, ":in and :within must be a Range" unless range.is_a?(Range)
      options[:minimum], options[:maximum] = range.begin, range.end
      options[:maximum] -= 1 if range.exclude_end?
    end

    super(options)
  end

  def check_validity!
    keys = CHECKS.keys & options.keys

    if keys.empty?
      raise ArgumentError, 'Range unspecified. Specify the :within, :maximum, :minimum, or :is option.'
    end

    keys.each do |key|
      value = options[key]

      unless value.is_a?(Integer) && value >= 0
        raise ArgumentError, ":#{key} must be a nonnegative Integer"
      end
    end
  end

  def validate_each(record, attribute, value)
    value = record.send(attribute.to_sym).reject(&:blank?).size

    CHECKS.each do |key, validity_check|
      next unless check_value = options[key]
      next if value && value.send(validity_check, check_value)

      errors_options = options.except(*RESERVED_OPTIONS)
      errors_options[:count] = check_value

      default_message = options[MESSAGES[key]]
      errors_options[:message] ||= default_message if default_message

      record.errors.add(attribute, MESSAGES[key], errors_options)
    end
  end
end