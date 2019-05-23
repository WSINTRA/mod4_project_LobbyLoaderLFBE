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

ActiveRecord::Schema.define(version: 2019_05_23_195101) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gamegenres", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_gamegenres_on_game_id"
    t.index ["genre_id"], name: "index_gamegenres_on_genre_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_messages_on_party_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "ownedgames", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_ownedgames_on_game_id"
    t.index ["user_id"], name: "index_ownedgames_on_user_id"
  end

  create_table "parties", force: :cascade do |t|
    t.string "name"
    t.integer "partysize"
    t.bigint "user_id"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_parties_on_game_id"
    t.index ["user_id"], name: "index_parties_on_user_id"
  end

  create_table "partymembers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_partymembers_on_party_id"
    t.index ["user_id"], name: "index_partymembers_on_user_id"
  end

  create_table "playerinterests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_playerinterests_on_genre_id"
    t.index ["user_id"], name: "index_playerinterests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "gamegenres", "games"
  add_foreign_key "gamegenres", "genres"
  add_foreign_key "messages", "parties"
  add_foreign_key "messages", "users"
  add_foreign_key "ownedgames", "games"
  add_foreign_key "ownedgames", "users"
  add_foreign_key "parties", "games"
  add_foreign_key "parties", "users"
  add_foreign_key "partymembers", "parties"
  add_foreign_key "partymembers", "users"
  add_foreign_key "playerinterests", "genres"
  add_foreign_key "playerinterests", "users"
end
