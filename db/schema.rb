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

ActiveRecord::Schema.define(version: 20160328015746) do

  create_table "infos", force: :cascade do |t|
    t.integer "user_id",       limit: 4
    t.string  "user_sex",      limit: 255,   default: "男"
    t.text    "head_portrait", limit: 65535
    t.string  "image_size",    limit: 255,   default: "16"
    t.string  "nickname",      limit: 255,   default: "john"
    t.integer "age",           limit: 4,     default: 25
    t.integer "height",        limit: 4,     default: 175
    t.integer "weight",        limit: 4,     default: 70
    t.integer "pace",          limit: 4,     default: 70
    t.integer "phone_number1", limit: 4
    t.integer "phone_number2", limit: 4
  end

  create_table "revisions", force: :cascade do |t|
    t.string "version",   limit: 255
    t.string "file_name", limit: 255
    t.string "file_url",  limit: 255
  end

  create_table "security_codes", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "settings", force: :cascade do |t|
    t.integer "user_id",    limit: 4
    t.integer "calorie",    limit: 4,  default: 320
    t.integer "sport_time", limit: 4,  default: 70
    t.integer "step",       limit: 4,  default: 8000
    t.float   "distance",   limit: 24, default: 5.7
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 255
    t.string "userpwd",  limit: 255
  end

end
