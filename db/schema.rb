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

ActiveRecord::Schema.define(version: 20161005220028) do

  create_table "cohorts", force: :cascade do |t|
    t.string   "name"
    t.string   "learn_batch_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "entries", force: :cascade do |t|
    t.string   "name"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.string   "learn_uid"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "cohort_id"
  end

  add_index "students", ["cohort_id"], name: "index_students_on_cohort_id"

  create_table "user_cohorts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "cohort_id"
  end

  add_index "user_cohorts", ["cohort_id"], name: "index_user_cohorts_on_cohort_id"
  add_index "user_cohorts", ["user_id"], name: "index_user_cohorts_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string  "email"
    t.string  "learn_uid"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "learn_oauth_token"
    t.boolean "admin",             default: false
  end

end
