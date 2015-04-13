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

ActiveRecord::Schema.define(version: 20150404191449) do

  create_table "meals", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "price",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_elements", force: :cascade do |t|
    t.integer  "table_order_id", limit: 4
    t.integer  "meal_id",        limit: 4
    t.integer  "quantity",       limit: 4
    t.float    "amount",         limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "table_orders", force: :cascade do |t|
    t.integer  "waiter_id",  limit: 4
    t.integer  "table_id",   limit: 4
    t.float    "amount",     limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tables", force: :cascade do |t|
    t.string "number",      limit: 255
    t.text   "description", limit: 65535
  end

  create_table "waiters", force: :cascade do |t|
    t.string   "waiter_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
