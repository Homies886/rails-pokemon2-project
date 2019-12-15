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

ActiveRecord::Schema.define(version: 2019_12_15_212405) do

  create_table "captures", force: :cascade do |t|
    t.string "pokeball"
    t.date "captured"
    t.integer "user_id", null: false
    t.integer "pokemon_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id"], name: "index_captures_on_pokemon_id"
    t.index ["user_id"], name: "index_captures_on_user_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "region_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["region_id"], name: "index_pokemons_on_region_id"
    t.index ["user_id"], name: "index_pokemons_on_user_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
  end

  add_foreign_key "captures", "pokemons"
  add_foreign_key "captures", "users"
  add_foreign_key "pokemons", "regions"
  add_foreign_key "pokemons", "users"
end
