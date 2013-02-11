# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130130062734) do

  create_table "adventurers", :force => true do |t|
    t.integer "hero_id",                      :null => false
    t.integer "profession_id",                :null => false
    t.integer "available_xp",  :default => 0, :null => false
    t.integer "user_id"
  end

  add_index "adventurers", ["hero_id"], :name => "index_adventurers_on_hero_id"
  add_index "adventurers", ["profession_id"], :name => "index_adventurers_on_profession_id"
  add_index "adventurers", ["user_id"], :name => "index_adventurers_on_user_id"

  create_table "adventurers_adventures", :force => true do |t|
    t.integer "adventure_id",  :null => false
    t.integer "adventurer_id", :null => false
  end

  add_index "adventurers_adventures", ["adventure_id"], :name => "index_adventurers_adventures_on_adventure_id"
  add_index "adventurers_adventures", ["adventurer_id"], :name => "index_adventurers_adventures_on_adventurer_id"

  create_table "adventurers_items", :force => true do |t|
    t.integer "item_id",       :null => false
    t.integer "adventurer_id", :null => false
  end

  add_index "adventurers_items", ["adventurer_id"], :name => "index_adventurers_items_on_adventurer_id"
  add_index "adventurers_items", ["item_id"], :name => "index_adventurers_items_on_item_id"

  create_table "adventurers_skills", :force => true do |t|
    t.integer "skill_id",      :null => false
    t.integer "adventurer_id", :null => false
  end

  add_index "adventurers_skills", ["adventurer_id"], :name => "index_adventurers_skills_on_adventurer_id"
  add_index "adventurers_skills", ["skill_id"], :name => "index_adventurers_skills_on_skill_id"

  create_table "adventures", :force => true do |t|
    t.integer  "user_id",                                      :null => false
    t.string   "name",                                         :null => false
    t.text     "description"
    t.integer  "campaign_id",                                  :null => false
    t.string   "current_act",             :default => "Intro", :null => false
    t.string   "winner"
    t.datetime "completed_at"
    t.integer  "ol_user_id"
    t.integer  "ol_available_xp",         :default => 0,       :null => false
    t.integer  "hero_gold",               :default => 0,       :null => false
    t.integer  "hero_starting_xp",        :default => 0,       :null => false
    t.integer  "hero_starting_gold",      :default => 0,       :null => false
    t.integer  "ol_starting_xp",          :default => 0,       :null => false
    t.integer  "ol_open_group_pool_size", :default => 0,       :null => false
    t.boolean  "skip_intro",              :default => false
    t.boolean  "is_private",              :default => false,   :null => false
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "adventures", ["user_id"], :name => "index_adventures_on_user_id"

  create_table "adventures_items", :force => true do |t|
    t.integer "item_id",      :null => false
    t.integer "adventure_id", :null => false
  end

  add_index "adventures_items", ["adventure_id"], :name => "index_adventures_items_on_adventure_id"
  add_index "adventures_items", ["item_id"], :name => "index_adventures_items_on_item_id"

  create_table "adventures_overlord_cards", :force => true do |t|
    t.integer "overlord_card_id", :null => false
    t.integer "adventure_id",     :null => false
  end

  add_index "adventures_overlord_cards", ["adventure_id"], :name => "index_adventures_overlord_cards_on_adventure_id"
  add_index "adventures_overlord_cards", ["overlord_card_id"], :name => "index_adventures_overlord_cards_on_overlord_card_id"

  create_table "archetypes", :force => true do |t|
    t.string  "name",        :null => false
    t.string  "slug",        :null => false
    t.string  "logo_url"
    t.integer "game_id"
    t.text    "description"
  end

  add_index "archetypes", ["game_id"], :name => "index_archetypes_on_game_id"
  add_index "archetypes", ["name"], :name => "index_archetypes_on_name", :unique => true
  add_index "archetypes", ["slug"], :name => "index_archetypes_on_slug", :unique => true

  create_table "campaigns", :force => true do |t|
    t.string   "name",                                   :null => false
    t.string   "slug",                                   :null => false
    t.integer  "quests_count",        :default => 0,     :null => false
    t.integer  "game_id"
    t.integer  "user_id",                                :null => false
    t.boolean  "is_official",         :default => false, :null => false
    t.boolean  "is_published",        :default => false, :null => false
    t.integer  "intro_quest_id"
    t.integer  "act1_quests",         :default => 1,     :null => false
    t.integer  "interlude_heroes_id"
    t.integer  "interlude_ol_id"
    t.integer  "act2_quests",         :default => 1,     :null => false
    t.integer  "finale_heroes_id"
    t.integer  "finale_ol_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "campaigns", ["game_id"], :name => "index_campaigns_on_game_id"
  add_index "campaigns", ["name"], :name => "index_campaigns_on_name", :unique => true
  add_index "campaigns", ["slug"], :name => "index_campaigns_on_slug", :unique => true
  add_index "campaigns", ["user_id"], :name => "index_campaigns_on_user_id"

  create_table "chapters", :force => true do |t|
    t.integer  "adventure_id"
    t.integer  "quest_id",                              :null => false
    t.string   "e1_winner"
    t.string   "e2_winner"
    t.string   "final_winner"
    t.string   "e1_open_monsters"
    t.string   "e2_open_monsters"
    t.integer  "hero1_id"
    t.integer  "hero2_id"
    t.integer  "hero3_id"
    t.integer  "hero4_id"
    t.integer  "hero1_profession_id"
    t.integer  "hero2_profession_id"
    t.integer  "hero3_profession_id"
    t.integer  "hero4_profession_id"
    t.integer  "gold_from_search_items", :default => 0, :null => false
    t.string   "items_found"
    t.string   "items_sold"
    t.string   "items_bought"
    t.string   "skills_bought"
    t.text     "report"
    t.integer  "user_id",                               :null => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  add_index "chapters", ["adventure_id"], :name => "index_chapters_on_adventure_id"
  add_index "chapters", ["quest_id"], :name => "index_chapters_on_quest_id"
  add_index "chapters", ["user_id"], :name => "index_chapters_on_user_id"

  create_table "encounters", :force => true do |t|
    t.string   "name",                           :null => false
    t.integer  "quest_id",                       :null => false
    t.integer  "position",        :default => 1, :null => false
    t.text     "description"
    t.text     "introduction"
    t.text     "setup"
    t.text     "special_rules"
    t.text     "reinforcements"
    t.text     "victory"
    t.text     "rewards"
    t.integer  "num_open_groups", :default => 0, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "encounters", ["position"], :name => "index_encounters_on_position"
  add_index "encounters", ["quest_id", "position"], :name => "index_encounters_on_quest_id_and_position", :unique => true
  add_index "encounters", ["quest_id"], :name => "index_encounters_on_quest_id"

  create_table "encounters_monsters", :force => true do |t|
    t.integer "encounter_id", :null => false
    t.integer "monster_id",   :null => false
  end

  add_index "encounters_monsters", ["encounter_id"], :name => "index_encounters_monsters_on_encounter_id"
  add_index "encounters_monsters", ["monster_id"], :name => "index_encounters_monsters_on_monster_id"

  create_table "encounters_traits", :force => true do |t|
    t.integer "encounter_id", :null => false
    t.integer "trait_id",     :null => false
  end

  add_index "encounters_traits", ["encounter_id"], :name => "index_encounters_traits_on_encounter_id"
  add_index "encounters_traits", ["trait_id"], :name => "index_encounters_traits_on_trait_id"

  create_table "familiars", :force => true do |t|
    t.string   "name",                             :null => false
    t.string   "slug",                             :null => false
    t.integer  "speed"
    t.integer  "health"
    t.string   "defense"
    t.string   "rule1",                            :null => false
    t.string   "rule2"
    t.string   "rule3"
    t.string   "rule4"
    t.string   "attack_type"
    t.string   "dice"
    t.integer  "game_id"
    t.integer  "hero_id"
    t.integer  "profession_id"
    t.boolean  "is_official",   :default => false, :null => false
    t.boolean  "is_published",  :default => false, :null => false
    t.integer  "group_id"
    t.integer  "user_id",                          :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "familiars", ["game_id"], :name => "index_familiars_on_game_id"
  add_index "familiars", ["group_id"], :name => "index_familiars_on_group_id"
  add_index "familiars", ["hero_id"], :name => "index_familiars_on_hero_id"
  add_index "familiars", ["name"], :name => "index_familiars_on_name", :unique => true
  add_index "familiars", ["profession_id"], :name => "index_familiars_on_profession_id"
  add_index "familiars", ["slug"], :name => "index_familiars_on_slug", :unique => true
  add_index "familiars", ["user_id"], :name => "index_familiars_on_user_id"

  create_table "games", :force => true do |t|
    t.string  "name",                                :null => false
    t.string  "slug",                                :null => false
    t.string  "short_name",                          :null => false
    t.string  "very_short_name",                     :null => false
    t.string  "bgg_url"
    t.integer "expands_game_id"
    t.integer "monsters_count",       :default => 0, :null => false
    t.integer "heroes_count",         :default => 0, :null => false
    t.integer "quests_count",         :default => 0, :null => false
    t.integer "items_count",          :default => 0, :null => false
    t.integer "overlord_cards_count", :default => 0, :null => false
  end

  add_index "games", ["name"], :name => "index_games_on_name", :unique => true
  add_index "games", ["slug"], :name => "index_games_on_slug", :unique => true

  create_table "games_heroes", :force => true do |t|
    t.integer "hero_id", :null => false
    t.integer "user_id", :null => false
  end

  add_index "games_heroes", ["hero_id"], :name => "index_games_heroes_on_hero_id"
  add_index "games_heroes", ["user_id"], :name => "index_games_heroes_on_user_id"

  create_table "games_users", :force => true do |t|
    t.integer "game_id", :null => false
    t.integer "user_id", :null => false
  end

  add_index "games_users", ["game_id"], :name => "index_games_users_on_game_id"
  add_index "games_users", ["user_id"], :name => "index_games_users_on_user_id"

  create_table "heroes", :force => true do |t|
    t.string   "name",                               :null => false
    t.string   "slug",                               :null => false
    t.integer  "game_id"
    t.integer  "archetype_id",                       :null => false
    t.integer  "speed",                              :null => false
    t.integer  "health",                             :null => false
    t.integer  "stamina",                            :null => false
    t.string   "defense",      :default => "{GREY}", :null => false
    t.integer  "might",                              :null => false
    t.integer  "knowledge",                          :null => false
    t.integer  "willpower",                          :null => false
    t.integer  "awareness",                          :null => false
    t.text     "ability"
    t.text     "feat"
    t.integer  "user_id",                            :null => false
    t.boolean  "is_official",  :default => false,    :null => false
    t.boolean  "is_published", :default => false,    :null => false
    t.text     "description"
    t.integer  "group_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "heroes", ["archetype_id"], :name => "index_heroes_on_archetype_id"
  add_index "heroes", ["game_id"], :name => "index_heroes_on_game_id"
  add_index "heroes", ["group_id"], :name => "index_heroes_on_group_id"
  add_index "heroes", ["name"], :name => "index_heroes_on_name", :unique => true
  add_index "heroes", ["slug"], :name => "index_heroes_on_slug", :unique => true
  add_index "heroes", ["user_id"], :name => "index_heroes_on_user_id"

  create_table "heroes_users", :force => true do |t|
    t.integer "hero_id", :null => false
    t.integer "user_id", :null => false
  end

  add_index "heroes_users", ["hero_id"], :name => "index_heroes_users_on_hero_id"
  add_index "heroes_users", ["user_id"], :name => "index_heroes_users_on_user_id"

  create_table "items", :force => true do |t|
    t.string   "name",                                      :null => false
    t.string   "slug",                                      :null => false
    t.string   "attack_type"
    t.string   "subclass1",                                 :null => false
    t.string   "subclass2"
    t.string   "equip_type",                                :null => false
    t.string   "dice"
    t.integer  "buy_cost",      :default => 0,              :null => false
    t.integer  "sell_cost",     :default => 0,              :null => false
    t.string   "trait1"
    t.string   "trait2"
    t.string   "trait3"
    t.string   "trait4"
    t.string   "rules"
    t.string   "category",      :default => "shop_item_a1", :null => false
    t.integer  "profession_id"
    t.integer  "game_id"
    t.integer  "user_id",                                   :null => false
    t.boolean  "is_official",   :default => false,          :null => false
    t.boolean  "is_published",  :default => false,          :null => false
    t.integer  "group_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "items", ["game_id"], :name => "index_items_on_game_id"
  add_index "items", ["group_id"], :name => "index_items_on_group_id"
  add_index "items", ["name"], :name => "index_items_on_name"
  add_index "items", ["profession_id"], :name => "index_items_on_profession_id"
  add_index "items", ["slug"], :name => "index_items_on_slug", :unique => true
  add_index "items", ["user_id"], :name => "index_items_on_user_id"

  create_table "monsters", :force => true do |t|
    t.string   "name",                                      :null => false
    t.string   "slug",                                      :null => false
    t.string   "role",               :default => "Monster", :null => false
    t.string   "attack_type",        :default => "Melee",   :null => false
    t.integer  "game_id",                                   :null => false
    t.integer  "user_id",                                   :null => false
    t.integer  "group_id"
    t.boolean  "is_official",        :default => false,     :null => false
    t.boolean  "is_published",       :default => false,     :null => false
    t.text     "description"
    t.integer  "num_tan2"
    t.integer  "num_red2"
    t.integer  "num_tan3"
    t.integer  "num_red3"
    t.integer  "num_tan4"
    t.integer  "num_red4"
    t.string   "act1_tan_attack"
    t.string   "act2_tan_attack"
    t.string   "act1_red_attack"
    t.string   "act2_red_attack"
    t.integer  "act1_tan_speed"
    t.integer  "act1_red_speed"
    t.integer  "act2_tan_speed"
    t.integer  "act2_red_speed"
    t.integer  "act1_tan_health"
    t.integer  "act1_red_health"
    t.integer  "act2_tan_health"
    t.integer  "act2_red_health"
    t.string   "act1_tan_defense"
    t.string   "act1_red_defense"
    t.string   "act2_tan_defense"
    t.string   "act2_red_defense"
    t.integer  "act1_2p_lt_speed"
    t.integer  "act1_3p_lt_speed"
    t.integer  "act1_4p_lt_speed"
    t.integer  "act1_2p_lt_health"
    t.integer  "act1_4p_lt_health"
    t.string   "act1_2p_lt_defense"
    t.string   "act1_3p_lt_defense"
    t.string   "act1_4p_lt_defense"
    t.string   "act1_lt_attack"
    t.string   "act2_lt_attack"
    t.integer  "might"
    t.integer  "knowledge"
    t.integer  "willpower"
    t.integer  "awareness"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "monsters", ["game_id"], :name => "index_monsters_on_game_id"
  add_index "monsters", ["group_id"], :name => "index_monsters_on_group_id"
  add_index "monsters", ["name"], :name => "index_monsters_on_name", :unique => true
  add_index "monsters", ["slug"], :name => "index_monsters_on_slug", :unique => true
  add_index "monsters", ["user_id"], :name => "index_monsters_on_user_id"

  create_table "monsters_traits", :force => true do |t|
    t.integer "monster_id", :null => false
    t.integer "trait_id",   :null => false
  end

  add_index "monsters_traits", ["monster_id"], :name => "index_monsters_traits_on_monster_id"
  add_index "monsters_traits", ["trait_id"], :name => "index_monsters_traits_on_trait_id"

  create_table "monsters_users", :force => true do |t|
    t.integer "monster_id", :null => false
    t.integer "user_id",    :null => false
  end

  add_index "monsters_users", ["monster_id"], :name => "index_monsters_users_on_monster_id"
  add_index "monsters_users", ["user_id"], :name => "index_monsters_users_on_user_id"

  create_table "overlord_cards", :force => true do |t|
    t.string   "name",                            :null => false
    t.string   "slug",                            :null => false
    t.string   "subclass",                        :null => false
    t.string   "category",                        :null => false
    t.integer  "xp_cost",      :default => 0,     :null => false
    t.text     "text"
    t.integer  "user_id",                         :null => false
    t.boolean  "is_official",  :default => false, :null => false
    t.boolean  "is_published", :default => false, :null => false
    t.integer  "game_id"
    t.integer  "group_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "overlord_cards", ["game_id"], :name => "index_overlord_cards_on_game_id"
  add_index "overlord_cards", ["group_id"], :name => "index_overlord_cards_on_group_id"
  add_index "overlord_cards", ["name"], :name => "index_overlord_cards_on_name"
  add_index "overlord_cards", ["slug"], :name => "index_overlord_cards_on_slug", :unique => true
  add_index "overlord_cards", ["user_id"], :name => "index_overlord_cards_on_user_id"

  create_table "professions", :force => true do |t|
    t.string   "name",                            :null => false
    t.string   "slug",                            :null => false
    t.integer  "archetype_id",                    :null => false
    t.integer  "game_id"
    t.text     "description"
    t.boolean  "is_official",  :default => false, :null => false
    t.boolean  "is_published", :default => false, :null => false
    t.integer  "group_id"
    t.integer  "user_id",                         :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "professions", ["archetype_id"], :name => "index_professions_on_archetype_id"
  add_index "professions", ["game_id"], :name => "index_professions_on_game_id"
  add_index "professions", ["group_id"], :name => "index_professions_on_group_id"
  add_index "professions", ["name"], :name => "index_professions_on_name", :unique => true
  add_index "professions", ["slug"], :name => "index_professions_on_slug", :unique => true
  add_index "professions", ["user_id"], :name => "index_professions_on_user_id"

  create_table "quests", :force => true do |t|
    t.string   "name",                                              :null => false
    t.string   "slug",                                              :null => false
    t.integer  "encounters_count",               :default => 0,     :null => false
    t.integer  "position"
    t.string   "act"
    t.boolean  "official_release",               :default => false, :null => false
    t.integer  "campaign_id"
    t.integer  "user_id",                                           :null => false
    t.integer  "group_id"
    t.boolean  "is_official",                    :default => false, :null => false
    t.boolean  "is_published",                   :default => false, :null => false
    t.integer  "reward_xp_base",                 :default => 1,     :null => false
    t.integer  "reward_xp_hero",                 :default => 0,     :null => false
    t.integer  "reward_xp_ol",                   :default => 0,     :null => false
    t.integer  "hero_win_gold",                  :default => 0,     :null => false
    t.integer  "hero_win_item_id"
    t.integer  "ol_win_item_id"
    t.integer  "hero_win_ol_lose_item_id"
    t.integer  "ol_win_heroes_lose_item_id"
    t.integer  "hero_win_lose_overlord_card_id"
    t.integer  "ol_win_gain_overlord_card_id"
    t.integer  "hero_win_unlock_quest_id"
    t.integer  "ol_win_unlock_quest_id"
    t.string   "hero_win_ongoing_effect"
    t.string   "ol_win_ongoing_effect"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  add_index "quests", ["campaign_id"], :name => "index_quests_on_campaign_id"
  add_index "quests", ["group_id"], :name => "index_quests_on_group_id"
  add_index "quests", ["name"], :name => "index_quests_on_name", :unique => true
  add_index "quests", ["slug"], :name => "index_quests_on_slug", :unique => true
  add_index "quests", ["user_id"], :name => "index_quests_on_user_id"

  create_table "skills", :force => true do |t|
    t.integer  "profession_id",                    :null => false
    t.string   "name",                             :null => false
    t.string   "slug",                             :null => false
    t.integer  "xp_cost",       :default => 0,     :null => false
    t.string   "rule1",                            :null => false
    t.string   "rule2"
    t.string   "rule3"
    t.string   "rule4"
    t.integer  "fatigue_cost",  :default => 0,     :null => false
    t.boolean  "is_official",   :default => false, :null => false
    t.boolean  "is_published",  :default => false, :null => false
    t.integer  "group_id"
    t.integer  "user_id",                          :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "skills", ["group_id"], :name => "index_skills_on_group_id"
  add_index "skills", ["name"], :name => "index_skills_on_name", :unique => true
  add_index "skills", ["profession_id"], :name => "index_skills_on_profession_id"
  add_index "skills", ["slug"], :name => "index_skills_on_slug", :unique => true
  add_index "skills", ["user_id"], :name => "index_skills_on_user_id"

  create_table "traits", :force => true do |t|
    t.string "name",  :null => false
    t.string "slug",  :null => false
    t.string "image"
  end

  add_index "traits", ["name"], :name => "index_traits_on_name", :unique => true
  add_index "traits", ["slug"], :name => "index_traits_on_slug", :unique => true

  create_table "users", :force => true do |t|
    t.string   "username",                                   :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role",                   :default => "user", :null => false
    t.string   "country"
    t.string   "city"
    t.string   "postal_code"
    t.date     "birthdate"
    t.string   "bgg_profile_name"
    t.string   "email",                  :default => "",     :null => false
    t.string   "encrypted_password",     :default => "",     :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "users", ["bgg_profile_name"], :name => "index_users_on_bgg_profile_name", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
