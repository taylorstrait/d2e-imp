class Adventurer < ActiveRecord::Base
  belongs_to :user
  belongs_to :hero
  belongs_to :profession
  has_and_belongs_to_many :adventures
  has_and_belongs_to_many :items
  has_and_belongs_to_many :skills

  validates :hero, :presence => true
  validates :profession, :presence => true

  def unlearned_skills
    profession.skills.where("id NOT IN (?)", self.skill_ids).order("xp_cost DESC", :name).all
  end

    private

    def before_destroy
      adventures.clear
      items.clear
      skills.clear
    end


end
