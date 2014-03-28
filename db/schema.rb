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

ActiveRecord::Schema.define(version: 20140328202014) do

  create_table "customers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["name"], name: "index_customers_on_name"

  create_table "items", force: true do |t|
    t.integer  "merchant_id",                         null: false
    t.text     "description",                         null: false
    t.decimal  "price",       precision: 5, scale: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["merchant_id"], name: "index_items_on_merchant_id"

  create_table "merchants", force: true do |t|
    t.string   "name",       null: false
    t.string   "address",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "merchants", ["name"], name: "index_merchants_on_name"

  create_table "orders", force: true do |t|
    t.integer  "item_id",     null: false
    t.integer  "customer_id", null: false
    t.integer  "quantity",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id"
  add_index "orders", ["item_id"], name: "index_orders_on_item_id"

end
