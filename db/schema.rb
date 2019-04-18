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


ActiveRecord::Schema.define(version: 2019_04_18_113952) do


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
    t.string "authentication_token", limit: 30
    t.string "address"
    t.index ["authentication_token"], name: "index_customers_on_authentication_token", unique: true
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "timestamp"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "page"
    t.string "shop_id"
    t.integer "customer_id"
    t.string "item_id"
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

  create_table "messages", force: :cascade do |t|
    t.string "ToUserName"
    t.string "FromUserName"
    t.string "CreateTime"
    t.string "MsgType"
    t.string "Content"
    t.integer "MsgId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "booked", default: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["item_id"], name: "index_orders_on_item_id"
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
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "authentication_token", limit: 30
    t.string "phone_number"
    t.float "latitude"
    t.float "longitude"
    t.index ["authentication_token"], name: "index_shops_on_authentication_token", unique: true
    t.index ["email"], name: "index_shops_on_email", unique: true
    t.index ["reset_password_token"], name: "index_shops_on_reset_password_token", unique: true
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "open_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickName"
    t.string "gender"
    t.string "language"
    t.string "city"
    t.string "province"
    t.string "country"
    t.string "avatarUrl"
  end

  add_foreign_key "items", "shops"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "items"
end
