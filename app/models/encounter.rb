class Encounter < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :position

  has_and_belongs_to_many :traits
  has_and_belongs_to_many :monsters
  belongs_to :quest, :counter_cache => true

  #TODO - make this work
  #validate :trait_ids, :relationship => {:minimum => 2}
  validates :name, :presence => true
  
  

  # using the traits of an encounter, generate a pool of monsters to choose from
  # user_id =  integer to determine available monsters that user owns
  # pool_size = integer to set the number of monsters to draw per open group
  def generate_open_group_monsters(user_id = nil, pool_size = 3)

    # fix a few possible errors
    if pool_size == 0 || pool_size > 6
      pool_size = 3
    end

    # define our overall monster options

    user = User.find_by_id(user_id.to_i)

    if user && !user.monster_ids.empty?
      monster_list = user.monster_ids
    else
      monster_list = Monster.pluck(:id)
    end

    # find monsters that match encounter traits AND are an available option
    if self.monsters.size > 0
      all_matching_monsters = Monster.joins(:traits).select(['monsters.id', 'monsters.name', 'monsters.slug']).where(:traits => {:id => self.trait_ids}).where("role = 'Monster' AND monster_id IN (?)", monster_list).where("monsters.id NOT IN (?)", self.monster_ids).order("monsters.name ASC").uniq
    else
      all_matching_monsters = Monster.joins(:traits).select(['monsters.id', 'monsters.name', 'monsters.slug']).where(:traits => {:id => self.trait_ids}).where("role = 'Monster' AND monster_id IN (?)", monster_list).order("monsters.name ASC").uniq
    end
    
    # if we found any matching monsters...
    if all_matching_monsters.size > 0
      # generate limited pool
      monster_options = all_matching_monsters.clone.shuffle

      # break out the open groups
      # init counter
      counter = 1
      open_group = {}

      # for each open group...
      self.num_open_groups.times do

        # create a new nested variable
        open_group[counter] = []
        
        # for each card to draw...
        pool_size.to_i.times do
          
          # pop one card off the shuffled pool
          open_group[counter] << monster_options.pop

        end

        # alphabetize the list
        if open_group[counter].size > 1
          open_group[counter].sort_by! &:name
        end
        counter += 1
      end

      # alphabetize the remaining options and return
      return open_group

    else
      return nil
    end

  end

end
