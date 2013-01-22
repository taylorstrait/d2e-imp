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

ActiveRecord::Schema.define(:version => 20130121212726) do

  create_table "campaigns", :force => true do |t|
    t.string   "name",                                :null => false
    t.integer  "quests_count",     :default => 0,     :null => false
    t.boolean  "official_release", :default => false, :null => false
    t.integer  "game_id"
    t.integer  "user_id",                             :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "campaigns", ["game_id"], :name => "index_campaigns_on_game_id"

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

  create_table "games", :force => true do |t|
    t.string  "name",                          :null => false
    t.string  "short_name",                    :null => false
    t.string  "bgg_url"
    t.integer "edition",        :default => 2, :null => false
    t.integer "monsters_count", :default => 0, :null => false
  end

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
    t.string  "name",                          :null => false
    t.integer "game_id"
    t.string  "archetype",                     :null => false
    t.integer "speed",                         :null => false
    t.integer "health",                        :null => false
    t.integer "stamina",                       :null => false
    t.string  "defense",   :default => "grey", :null => false
    t.integer "might",                         :null => false
    t.integer "knowledge",                     :null => false
    t.integer "willpower",                     :null => false
    t.integer "awareness",                     :null => false
    t.text    "ability"
    t.text    "feat"
  end

  create_table "heroes_users", :force => true do |t|
    t.integer "hero_id", :null => false
    t.integer "user_id", :null => false
  end

  add_index "heroes_users", ["hero_id"], :name => "index_heroes_users_on_hero_id"
  add_index "heroes_users", ["user_id"], :name => "index_heroes_users_on_user_id"

  create_table "items", :force => true do |t|
    t.string  "name",                                    :null => false
    t.string  "attack_type"
    t.string  "subclass1",                               :null => false
    t.string  "subclass2"
    t.string  "equip_type",                              :null => false
    t.string  "dice"
    t.integer "buy_cost",    :default => 0,              :null => false
    t.integer "sell_cost",   :default => 0,              :null => false
    t.string  "trait1"
    t.string  "trait2"
    t.string  "trait3"
    t.string  "trait4"
    t.string  "rules"
    t.integer "act"
    t.string  "category",    :default => "shop_item_a1", :null => false
    t.integer "game_id",                                 :null => false
  end

  add_index "items", ["game_id"], :name => "index_items_on_game_id"

  create_table "monsters", :force => true do |t|
    t.string  "name",                                      :null => false
    t.string  "role",               :default => "Monster", :null => false
    t.string  "attack_type",        :default => "Melee",   :null => false
    t.integer "game_id",                                   :null => false
    t.integer "num_tan2"
    t.integer "num_red2"
    t.integer "num_tan3"
    t.integer "num_red3"
    t.integer "num_tan4"
    t.integer "num_red4"
    t.string  "act1_tan_attack"
    t.string  "act2_tan_attack"
    t.string  "act1_red_attack"
    t.string  "act2_red_attack"
    t.integer "act1_tan_speed"
    t.integer "act1_red_speed"
    t.integer "act2_tan_speed"
    t.integer "act2_red_speed"
    t.integer "act1_tan_health"
    t.integer "act1_red_health"
    t.integer "act2_tan_health"
    t.integer "act2_red_health"
    t.string  "act1_tan_defense"
    t.string  "act1_red_defense"
    t.string  "act2_tan_defense"
    t.string  "act2_red_defense"
    t.integer "act1_2p_lt_speed"
    t.integer "act1_3p_lt_speed"
    t.integer "act1_4p_lt_speed"
    t.integer "act1_2p_lt_health"
    t.integer "act1_4p_lt_health"
    t.string  "act1_2p_lt_defense"
    t.string  "act1_3p_lt_defense"
    t.string  "act1_4p_lt_defense"
    t.string  "act1_lt_attack"
    t.string  "act2_lt_attack"
    t.integer "might"
    t.integer "knowledge"
    t.integer "willpower"
    t.integer "awareness"
  end

  add_index "monsters", ["game_id"], :name => "index_monsters_on_game_id"

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

  create_table "quests", :force => true do |t|
    t.string   "name",                                       :null => false
    t.integer  "encounters_count",        :default => 0,     :null => false
    t.integer  "page"
    t.integer  "position"
    t.integer  "act"
    t.boolean  "official_release",        :default => false, :null => false
    t.integer  "campaign_id"
    t.integer  "user_id",                                    :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.integer  "reward_xp_base",          :default => 1,     :null => false
    t.integer  "reward_xp_hero",          :default => 0,     :null => false
    t.integer  "reward_xp_hero_overlord", :default => 0,     :null => false
    t.integer  "reward_gold",             :default => 25,    :null => false
    t.integer  "reward_item_id"
  end

  add_index "quests", ["campaign_id"], :name => "index_quests_on_campaign_id"

  create_table "traits", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",                               :null => false
    t.string   "country"
    t.string   "city"
    t.string   "postal_code"
    t.date     "birthdate"
    t.string   "bgg_profile_name"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["bgg_profile_name"], :name => "index_users_on_bgg_profile_name", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
