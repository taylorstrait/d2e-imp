# creates a global variable containing all object names for global search
# this file is named z_ so that it loads after the inflections.rb and thus can load Heroes properly

if !defined?(::Rake) # don't run this if we are using rake (for migrating) since the tables won't be there
  @all_list = []
  @all_list << Campaign.where(:is_official => true).pluck(:name)
  @all_list << Quest.where(:is_official => true).pluck(:name)
  @all_list << Hero.where(:is_official => true).pluck(:name)
  @all_list << Item.where(:is_official => true).pluck(:name).uniq!
  @all_list << Monster.where(:is_official => true).pluck(:name)
  @all_list << Familiar.where(:is_official => true).pluck(:name)
  @all_list << Skill.where(:is_official => true).pluck(:name)
  @all_list << OverlordCard.where(:is_official => true).pluck(:name).uniq!
  
  ALL_OBJECT_NAMES = @all_list.flatten!
end
