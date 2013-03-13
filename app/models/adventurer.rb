class Adventurer < ActiveRecord::Base

  belongs_to :user
  belongs_to :hero
  belongs_to :profession
  belongs_to :adventure
  
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :items

  validates :hero_id, :presence => true
  validates :profession_id, :presence => true

  def unlearned_skills
    if skills.empty? # if someone deleted all basic skills
      profession.skills
    else # show other skills
      profession.skills.where("id NOT IN (?)", self.skill_ids).order("xp_cost DESC", :name).all
    end
  end

  private

    # cleanup all the HABTM tables on delete
    def before_destroy
      items.clear
      skills.clear
    end


end
