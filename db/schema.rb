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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20170726205642) do
=======
ActiveRecord::Schema.define(version: 20170725145610) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
>>>>>>> 5c34ae88457130ac051d6fec4a1e4f94988db68d

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "game_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_comments_on_game_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "game_players", force: :cascade do |t|
<<<<<<< HEAD
    t.integer "game_id"
    t.integer "user_id"
=======
    t.bigint "game_id"
    t.bigint "user_id"
>>>>>>> 5c34ae88457130ac051d6fec4a1e4f94988db68d
    t.boolean "host"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_players_on_game_id"
    t.index ["user_id"], name: "index_game_players_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "location"
    t.datetime "start"
    t.datetime "stop"
    t.string "sport"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.integer "user_id"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "games"
  add_foreign_key "comments", "users"
  add_foreign_key "game_players", "games"
  add_foreign_key "game_players", "users"
end
