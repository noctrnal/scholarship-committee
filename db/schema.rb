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

ActiveRecord::Schema.define(version: 20160131010233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.boolean  "citizen"
    t.string   "relative_name"
    t.string   "relative_address"
    t.string   "relative_city"
    t.string   "relative_state"
    t.string   "relative_zip"
    t.integer  "field_id"
    t.string   "field_text"
    t.integer  "degree_id"
    t.string   "degree_text"
    t.string   "school_name"
    t.string   "school_address"
    t.string   "school_city"
    t.string   "school_state"
    t.string   "school_zip"
    t.boolean  "school_acceptance"
    t.datetime "school_begin"
    t.boolean  "school_finish_this_year"
    t.string   "school_finish_this_year_text"
    t.integer  "tuition_summer"
    t.integer  "tuition_fall"
    t.integer  "tuition_winter"
    t.integer  "tuition_spring"
    t.integer  "books_summer"
    t.integer  "books_fall"
    t.integer  "books_winter"
    t.integer  "books_spring"
    t.integer  "room_summer"
    t.integer  "room_fall"
    t.integer  "room_winter"
    t.integer  "room_spring"
    t.integer  "other_summer"
    t.integer  "other_fall"
    t.integer  "other_winter"
    t.integer  "other_spring"
    t.integer  "hours_summer"
    t.integer  "hours_fall"
    t.integer  "hours_winter"
    t.integer  "hours_spring"
    t.string   "request_type"
    t.string   "comments"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "applications", ["degree_id"], name: "index_applications_on_degree_id", using: :btree
  add_index "applications", ["field_id"], name: "index_applications_on_field_id", using: :btree

  create_table "candidates", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "degrees", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer  "candidate_id"
    t.integer  "commitment"
    t.integer  "scholarship"
    t.integer  "recommendations"
    t.integer  "goals"
    t.string   "remarks"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
  end

  add_index "evaluations", ["user_id"], name: "index_evaluations_on_user_id", using: :btree

  create_table "fields", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.boolean  "moderator",              default: false
    t.string   "permanent_address"
    t.string   "permanent_city"
    t.string   "permanent_state"
    t.string   "permanent_zip"
    t.string   "current_address"
    t.string   "current_city"
    t.string   "current_state"
    t.string   "current_zip"
    t.integer  "permanent_phone"
    t.integer  "current_phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "applications", "degrees"
  add_foreign_key "applications", "fields"
  add_foreign_key "evaluations", "users"
end
