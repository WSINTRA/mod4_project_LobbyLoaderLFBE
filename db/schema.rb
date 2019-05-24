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

ActiveRecord::Schema.define(version: 2019_05_24_180833) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coverimages", force: :cascade do |t|
    t.string "original_url"
    t.string "large_url"
    t.string "image_id"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_coverimages_on_game_id"
  end

  create_table "gamegenres", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_gamegenres_on_game_id"
    t.index ["genre_id"], name: "index_gamegenres_on_genre_id"
  end

  create_table "gamekeywords", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "keyword_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_gamekeywords_on_game_id"
    t.index ["keyword_id"], name: "index_gamekeywords_on_keyword_id"
  end

  create_table "gamemodes", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "mode_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_gamemodes_on_game_id"
    t.index ["mode_id"], name: "index_gamemodes_on_mode_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.text "summary"
    t.string "slug_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.integer "igdb_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.string "name"
    t.string "slug_name"
    t.integer "igdb_id"
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

  create_table "modes", force: :cascade do |t|
    t.string "name"
    t.string "slug_name"
    t.integer "igdb_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.text "description"
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

  create_table "platforms", force: :cascade do |t|
    t.string "name"
    t.string "alt_name"
    t.string "slug_name"
    t.string "abbreviation"
    t.integer "igdb_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playerinterests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_playerinterests_on_genre_id"
    t.index ["user_id"], name: "index_playerinterests_on_user_id"
  end

  create_table "releases", force: :cascade do |t|
    t.string "date"
    t.bigint "game_id"
    t.bigint "platform_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_releases_on_game_id"
    t.index ["platform_id"], name: "index_releases_on_platform_id"
  end

  create_table "screenshots", force: :cascade do |t|
    t.string "original_url"
    t.string "large_url"
    t.string "image_id"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_screenshots_on_game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "display_name"
    t.string "image_url"
    t.text "bio"
    t.string "tag_line"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "websites", force: :cascade do |t|
    t.string "url"
    t.string "name"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_websites_on_game_id"
  end

  add_foreign_key "coverimages", "games"
  add_foreign_key "gamegenres", "games"
  add_foreign_key "gamegenres", "genres"
  add_foreign_key "gamekeywords", "games"
  add_foreign_key "gamekeywords", "keywords"
  add_foreign_key "gamemodes", "games"
  add_foreign_key "gamemodes", "modes"
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
  add_foreign_key "releases", "games"
  add_foreign_key "releases", "platforms"
  add_foreign_key "screenshots", "games"
  add_foreign_key "websites", "games"
end
