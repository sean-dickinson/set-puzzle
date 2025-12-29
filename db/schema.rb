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

ActiveRecord::Schema[8.1].define(version: 2025_12_28_204523) do
  create_table "puzzle_completions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "end_time"
    t.integer "puzzle_id", null: false
    t.json "sets"
    t.datetime "start_time"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["puzzle_id"], name: "index_puzzle_completions_on_puzzle_id"
    t.index ["user_id"], name: "index_puzzle_completions_on_user_id"
  end

  create_table "puzzles", force: :cascade do |t|
    t.json "cards"
    t.datetime "created_at", null: false
    t.date "date"
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "puzzle_completions", "puzzles"
  add_foreign_key "puzzle_completions", "users"
  add_foreign_key "sessions", "users"
end
