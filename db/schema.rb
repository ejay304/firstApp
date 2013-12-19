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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131129222352) do

  create_table "championships", force: true do |t|
    t.string   "name"
    t.integer  "federation_id"
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "championships", ["federation_id"], name: "index_championships_on_federation_id", using: :btree
  add_index "championships", ["season_id"], name: "index_championships_on_season_id", using: :btree

  create_table "clubs", force: true do |t|
    t.string   "name"
    t.string   "adress"
    t.integer  "zip"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facts", force: true do |t|
    t.time     "time"
    t.integer  "match_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "federations", force: true do |t|
    t.string   "name"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gyms", force: true do |t|
    t.string   "name"
    t.string   "adress"
    t.integer  "zip"
    t.string   "city"
    t.integer  "federation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gyms", ["federation_id"], name: "index_gyms_on_federation_id", using: :btree

  create_table "matches", force: true do |t|
    t.datetime "date"
    t.integer  "homeScore"
    t.integer  "awayScore"
    t.integer  "championship_id"
    t.integer  "gym_id"
    t.integer  "team_id1_id"
    t.integer  "team_id2_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matches", ["championship_id"], name: "index_matches_on_championship_id", using: :btree
  add_index "matches", ["gym_id"], name: "index_matches_on_gym_id", using: :btree
  add_index "matches", ["team_id1_id"], name: "index_matches_on_team_id1_id", using: :btree
  add_index "matches", ["team_id2_id"], name: "index_matches_on_team_id2_id", using: :btree

  create_table "members", force: true do |t|
    t.string   "name"
    t.string   "firstname"
    t.string   "login"
    t.string   "phone"
    t.string   "email"
    t.string   "password"
    t.integer  "federation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["federation_id"], name: "index_members_on_federation_id", using: :btree

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participants", force: true do |t|
    t.string   "name"
    t.string   "firstname"
    t.date     "birthday"
    t.string   "phone"
    t.boolean  "sexe"
    t.string   "type"
    t.integer  "noDossard"
    t.integer  "no_license"
    t.date     "dateQualification"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participants_teams", id: false, force: true do |t|
    t.integer "participants_id", null: false
    t.integer "teams_id",        null: false
  end

  create_table "seasons", force: true do |t|
    t.string   "name"
    t.date     "begin"
    t.date     "end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "homeColor"
    t.string   "awayColor"
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["club_id"], name: "index_teams_on_club_id", using: :btree

  create_table "timekeepers", force: true do |t|
    t.string   "login"
    t.string   "password"
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "timekeepers", ["club_id"], name: "index_timekeepers_on_club_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "nom"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
