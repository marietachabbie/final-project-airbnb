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

ActiveRecord::Schema.define(version: 2021_05_01_222131) do

  create_table "apartments", force: :cascade do |t|
    t.string "name"
    t.string "apartmentType"
    t.string "address"
    t.string "price"
    t.string "beds"
    t.string "rooms"
    t.string "guests"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_apartments_on_user_id"
  end

  create_table "hosts", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "email"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "property_id", null: false
    t.integer "host_id", null: false
    t.integer "guest_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["guest_id"], name: "index_orders_on_guest_id"
    t.index ["host_id"], name: "index_orders_on_host_id"
    t.index ["property_id"], name: "index_orders_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "title"
    t.string "propType"
    t.string "address"
    t.integer "price"
    t.integer "beds"
    t.integer "rooms"
    t.integer "guests"
    t.text "description"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "currency"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "reg_users", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "email"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

# Could not dump table "users" because of following StandardError
#   Unknown type '' for column 'isActive'

  add_foreign_key "apartments", "users"
  add_foreign_key "orders", "properties"
  add_foreign_key "orders", "users", column: "guest_id"
  add_foreign_key "orders", "users", column: "host_id"
  add_foreign_key "properties", "users"
end
