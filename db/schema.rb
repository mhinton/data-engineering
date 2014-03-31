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

ActiveRecord::Schema.define(version: 20140331131202) do

  create_table "customers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["name"], name: "index_customers_on_name"

  create_table "data_files", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
  end

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
    t.integer  "item_id",                  null: false
    t.integer  "customer_id",              null: false
    t.integer  "quantity",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "merchant_id",  default: 0, null: false
    t.integer  "data_file_id", default: 0, null: false
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id"
  add_index "orders", ["data_file_id"], name: "index_orders_on_data_file_id"
  add_index "orders", ["item_id"], name: "index_orders_on_item_id"
  add_index "orders", ["merchant_id"], name: "index_orders_on_merchant_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
