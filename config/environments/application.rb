# creates a global variable containing all object names for global search

@all_list = []
@all_list << Campaign.where(:is_official => true).pluck(:name)
@all_list << Quest.where(:is_official => true).pluck(:name)
@all_list << Hero.where(:is_official => true).pluck(:name)
@all_list << Item.where(:is_official => true).pluck(:name)
@all_list << Monster.where(:is_official => true).pluck(:name)
@all_list << Familiar.where(:is_official => true).pluck(:name)
@all_list << Skill.pluck(:name)
ALL_OBJECT_NAMES = @all_list.flatten!