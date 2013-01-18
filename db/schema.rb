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

ActiveRecord::Schema.define(:version => 20130117180302) do

  create_table "campaigns", :force => true do |t|
    t.string   "name",                        :null => false
    t.integer  "quests_count", :default => 0, :null => false
    t.integer  "game_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "campaigns", ["game_id"], :name => "index_campaigns_on_game_id"

  create_table "encounters", :force => true do |t|
    t.string   "name",                           :null => false
    t.integer  "quest_id",                       :null => false
    t.integer  "position",        :default => 1, :null => false
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
    t.string   "name",                          :null => false
    t.string   "short_name",                    :null => false
    t.string   "bgg_url"
    t.integer  "monsters_count", :default => 0, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "monsters", :force => true do |t|
    t.string   "name",                                    :null => false
    t.string   "trait1_id"
    t.string   "trait2_id"
    t.integer  "num_tan2"
    t.integer  "num_red2"
    t.integer  "num_tan3"
    t.integer  "num_red3"
    t.integer  "num_tan4"
    t.integer  "num_red4"
    t.string   "act1_tan_attack"
    t.string   "act2_red_attack"
    t.string   "act1_tan_speed"
    t.string   "act1_red_speed"
    t.string   "act2_tan_speed"
    t.string   "act2_red_speed"
    t.string   "act1_tan_health"
    t.string   "act1_red_health"
    t.string   "act2_tan_health"
    t.string   "act2_red_health"
    t.string   "act1_tan_defense"
    t.string   "act1_red_defense"
    t.string   "act2_tan_defense"
    t.string   "act2_red_defense"
    t.string   "role",             :default => "Monster", :null => false
    t.string   "attack_type",      :default => "Melee",   :null => false
    t.integer  "game_id",                                 :null => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "monsters", ["game_id"], :name => "index_monsters_on_game_id"
  add_index "monsters", ["trait1_id"], :name => "index_monsters_on_trait1_id"
  add_index "monsters", ["trait2_id"], :name => "index_monsters_on_trait2_id"

  create_table "monsters_traits", :force => true do |t|
    t.integer "monster_id", :null => false
    t.integer "trait_id",   :null => false
  end

  add_index "monsters_traits", ["monster_id"], :name => "index_monsters_traits_on_monster_id"
  add_index "monsters_traits", ["trait_id"], :name => "index_monsters_traits_on_trait_id"

  create_table "quests", :force => true do |t|
    t.string   "name",                            :null => false
    t.integer  "encounters_count", :default => 0, :null => false
    t.integer  "page"
    t.integer  "position"
    t.integer  "act"
    t.integer  "campaign_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "quests", ["campaign_id"], :name => "index_quests_on_campaign_id"

  create_table "traits", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
