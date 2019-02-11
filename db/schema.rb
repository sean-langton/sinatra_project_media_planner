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

ActiveRecord::Schema.define(version: 20190211041130) do

  create_table "channels", force: :cascade do |t|
    t.string "channel_name"
    t.float  "channel_budget"
    t.date   "channel_start_date"
    t.date   "channel_end_date"
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_name"
    t.float  "order_budget"
    t.date   "order_start_date"
    t.date   "order_end_date"
  end

  create_table "plans", force: :cascade do |t|
    t.string "plan_name"
    t.float  "plan_budget"
    t.date   "plan_start_date"
    t.date   "plan_end_date"
  end

  create_table "user_plans", force: :cascade do |t|
    t.string "user_id"
    t.float  "plan_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "password_digest"
  end

end
