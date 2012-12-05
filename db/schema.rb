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

ActiveRecord::Schema.define(:version => 20120628140353) do

  create_table "players", :force => true do |t|
    t.integer  "team_id"
    t.boolean  "bench",               :default => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "shirt_name"
    t.string   "full_first"
    t.string   "full_last"
    t.string   "position_english"
    t.string   "position_spanish"
    t.integer  "number",              :default => 0
    t.integer  "goals",               :default => 0
    t.integer  "assists",             :default => 0
    t.integer  "shots",               :default => 0
    t.integer  "on_goal_shots",       :default => 0
    t.integer  "crosses",             :default => 0
    t.integer  "penalty_kicks_shots", :default => 0
    t.integer  "penalty_kicks_goals", :default => 0
    t.integer  "foul_committed",      :default => 0
    t.integer  "foul_suffered",       :default => 0
    t.integer  "offsides",            :default => 0
    t.integer  "corner_kicks",        :default => 0
    t.integer  "goal_mouth_blocks",   :default => 0
    t.integer  "yellow_cards",        :default => 0
    t.integer  "red_cards",           :default => 0
    t.string   "starter"
    t.integer  "formation",           :default => 0
    t.string   "touch_total"
    t.string   "touch_passes"
    t.string   "touch_interceptions"
    t.string   "touch_blocks"
    t.string   "tackles"
    t.string   "aveg_pos_location"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "type_team"
    t.string   "location"
    t.string   "name"
    t.string   "alias"
    t.string   "display_name"
    t.string   "primary_color"
    t.string   "shorts_color"
    t.integer  "wins",                                          :default => 0
    t.integer  "ties",                                          :default => 0
    t.integer  "losses",                                        :default => 0
    t.decimal  "pct",             :precision => 8, :scale => 3, :default => 0.0
    t.integer  "linescore_score",                               :default => 0
    t.integer  "linescore_shots",                               :default => 0
    t.integer  "half_half",                                     :default => 0
    t.integer  "half_score",                                    :default => 0
    t.integer  "half_shots",                                    :default => 0
    t.string   "formation"
    t.datetime "created_at",                                                     :null => false
    t.datetime "updated_at",                                                     :null => false
  end

end
