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

ActiveRecord::Schema[7.0].define(version: 2024_01_07_020154) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "markers", force: :cascade do |t|
    t.string "gender_neutral_restrooms", default: [], array: true
    t.string "volume", default: [], array: true
    t.string "accessible_entrance", default: [], array: true
    t.string "customer_restrooms", default: [], array: true
    t.string "parking", default: [], array: true
    t.string "purchase_necessary", default: [], array: true
    t.string "sober", default: [], array: true
    t.string "child_friendly", default: [], array: true
    t.string "light_level", default: [], array: true
    t.string "public_transportation_nearby", default: [], array: true
    t.string "bipoc_friendly", default: [], array: true
    t.string "queer_friendly", default: [], array: true
    t.string "staff_responsiveness", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "third_space_id"
    t.index ["third_space_id"], name: "index_markers_on_third_space_id"
  end

  create_table "search_params", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "third_spaces", force: :cascade do |t|
    t.string "yelp_id"
    t.string "name"
    t.string "address"
    t.float "rating"
    t.string "phone"
    t.string "photos", default: [], array: true
    t.float "lat"
    t.float "lon"
    t.string "price"
    t.jsonb "hours"
    t.boolean "open_now"
    t.string "category"
    t.string "tags", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
