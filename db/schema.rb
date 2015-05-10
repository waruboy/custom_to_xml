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

ActiveRecord::Schema.define(version: 20150510133916) do

  create_table "items", force: :cascade do |t|
    t.date     "start_date"
    t.date     "cancel_date"
    t.string   "product_no"
    t.string   "size1"
    t.integer  "upc",              limit: 16
    t.decimal  "unit_price"
    t.decimal  "actual_price"
    t.decimal  "discount_percent"
    t.integer  "order_qty"
    t.integer  "ship_qty"
    t.integer  "cancel_qty"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "items_orders", id: false, force: :cascade do |t|
    t.integer  "item_id",    null: false
    t.integer  "order_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "items_orders", ["item_id", "order_id"], name: "index_items_orders_on_item_id_and_order_id", unique: true

  create_table "orders", force: :cascade do |t|
    t.integer  "purchase_order_no"
    t.string   "order_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "orders_parties", id: false, force: :cascade do |t|
    t.integer  "order_id",   null: false
    t.integer  "party_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders_parties", ["order_id", "party_id"], name: "index_orders_parties_on_order_id_and_party_id", unique: true

  create_table "orders_taggs", force: :cascade do |t|
    t.integer  "order_id",   null: false
    t.integer  "tagg_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders_taggs", ["order_id", "tagg_id"], name: "index_orders_taggs_on_order_id_and_tagg_id", unique: true

  create_table "parties", force: :cascade do |t|
    t.string   "name"
    t.string   "party_type"
    t.string   "one_time"
    t.string   "partner_no"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggs", force: :cascade do |t|
    t.string   "context"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
