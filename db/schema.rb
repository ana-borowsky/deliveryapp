# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_17_021905) do
  create_table "delivery_time_configurations", force: :cascade do |t|
    t.integer "delivery_time"
    t.integer "minimum_distance"
    t.integer "maximum_distance"
    t.integer "shipping_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipping_type_id"], name: "index_delivery_time_configurations_on_shipping_type_id"
  end

  create_table "price_per_distance_configurations", force: :cascade do |t|
    t.integer "minimum_distance"
    t.integer "maximum_distance"
    t.integer "price_per_distance"
    t.integer "shipping_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipping_type_id"], name: "index_price_per_distance_configurations_on_shipping_type_id"
  end

  create_table "shipping_types", force: :cascade do |t|
    t.string "name"
    t.integer "minimum_distance"
    t.integer "maximum_distance"
    t.integer "minimum_weight"
    t.integer "maximum_weight"
    t.integer "fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "year"
    t.string "manufacturer"
    t.string "model"
    t.string "license_plate"
    t.integer "load_capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "available", default: true
    t.boolean "maintenance", default: false
  end

  create_table "weight_configurations", force: :cascade do |t|
    t.integer "minimum_weight"
    t.integer "maximum_weight"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shipping_type_id", null: false
    t.index ["shipping_type_id"], name: "index_weight_configurations_on_shipping_type_id"
  end

  create_table "work_orders", force: :cascade do |t|
    t.string "pickup_address"
    t.string "delivery_address"
    t.integer "product_weight"
    t.integer "distance"
    t.integer "status", default: 0
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product_code"
    t.string "code"
    t.integer "shipping_type_id"
    t.integer "price"
    t.index ["shipping_type_id"], name: "index_work_orders_on_shipping_type_id"
  end

  add_foreign_key "delivery_time_configurations", "shipping_types"
  add_foreign_key "price_per_distance_configurations", "shipping_types"
  add_foreign_key "weight_configurations", "shipping_types"
  add_foreign_key "work_orders", "shipping_types"
end
