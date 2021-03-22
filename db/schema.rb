# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_22_133253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pedalos", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price_per_hour"
    t.bigint "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_pedalos_on_owner_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "transaction_price"
    t.date "start_time"
    t.date "end_time"
    t.boolean "accepted"
    t.bigint "user_id", null: false
    t.bigint "pedalo_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pedalo_id"], name: "index_reservations_on_pedalo_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.integer "age"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "pedalos", "users", column: "owner_id"
  add_foreign_key "reservations", "pedalos"
  add_foreign_key "reservations", "users"
end
