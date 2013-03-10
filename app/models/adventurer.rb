class Adventurer < ActiveRecord::Base
  
  after_create :set_starting_stuff

  belongs_to :user
  belongs_to :hero
  belongs_to :profession
  belongs_to :adventure
  
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :items

  validates :hero, :presence => true
  validates :profession, :presence => true

  def unlearned_skills
    if skills.empty? # if someone deleted all basic skills
      profession.skills
    else # show other skills
      profession.skills.where("id NOT IN (?)", self.skill_ids).order("xp_cost DESC", :name).all
    end
  end

    private

    # automatically add starting skills on creation
    def set_starting_stuff
      self.skills = profession.starting_skills
      self.items = self.profession.items
    end

    # automatically add starting items on creation
    def set_starting_items
      self.items = self.profession.items
    end

    # cleanup all the HABTM tables on delete
    def before_destroy
      items.clear
      skills.clear
    end


end
