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

ActiveRecord::Schema.define(version: 2019_04_08_093111) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "wechat_id"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "goods", force: :cascade do |t|
    t.bigint "shop_id"
    t.string "name"
    t.string "description"
    t.string "original_price"
    t.string "discount_price"
    t.integer "quantity"
    t.string "expiry_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_goods_on_shop_id"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "shop_id"
    t.string "name"
    t.string "description"
    t.string "original_price"
    t.string "discount_price"
    t.integer "quantity"
    t.string "expiry_time"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_items_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "description"
    t.string "avatar_url"
    t.string "opening_hours"
    t.integer "rating_from_diaping"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "goods", "shops"
  add_foreign_key "items", "shops"
end
