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

ActiveRecord::Schema.define(version: 20151001205910) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "check_ins", force: :cascade do |t|
    t.datetime "earliest_possible_checkin_time"
    t.datetime "latest_possible_checkin_time"
    t.boolean  "is_success"
    t.boolean  "is_reconciled"
    t.integer  "commitment_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "check_ins", ["commitment_id"], name: "index_check_ins_on_commitment_id", using: :btree

  create_table "commitments", force: :cascade do |t|
    t.integer  "num_cheat_days"
    t.integer  "duration"
    t.string   "ref_email"
    t.boolean  "is_success"
    t.string   "readable_time"
    t.integer  "time_range"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "commitments", ["user_id"], name: "index_commitments_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "check_ins", "commitments"
  add_foreign_key "commitments", "users"
end
