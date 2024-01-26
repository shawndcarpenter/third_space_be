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

ActiveRecord::Schema[7.0].define(version: 2024_01_24_192301) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "markers", force: :cascade do |t|
    t.string "name"
    t.bigint "third_space_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["third_space_id"], name: "index_markers_on_third_space_id"
  end

  create_table "review_objects", force: :cascade do |t|
    t.string "yelp_id"
    t.string "name"
    t.string "text"
    t.string "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "third_space_id"
    t.string "date"
    t.index ["third_space_id"], name: "index_review_objects_on_third_space_id"
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
    t.string "photos"
    t.float "lat"
    t.float "lon"
    t.string "price"
    t.jsonb "hours"
    t.boolean "open_now"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tags", default: [], array: true
  end

  create_table "user_third_spaces", force: :cascade do |t|
    t.bigint "third_space_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["third_space_id"], name: "index_user_third_spaces_on_third_space_id"
    t.index ["user_id"], name: "index_user_third_spaces_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "markers", "third_spaces"
  add_foreign_key "user_third_spaces", "third_spaces"
  add_foreign_key "user_third_spaces", "users"
end
