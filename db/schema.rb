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

ActiveRecord::Schema.define(version: 2021_12_02_153248) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "aways", force: :cascade do |t|
    t.integer "tour"
    t.string "home_team"
    t.string "result"
    t.string "away_team"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tournament_id", null: false
    t.datetime "match_date"
    t.index ["tournament_id"], name: "index_aways_on_tournament_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "stadium"
    t.float "total_market_value"
    t.integer "tournament_position"
    t.float "average_age"
    t.integer "titles"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cost_type"
  end

  create_table "coaches", force: :cascade do |t|
    t.string "name"
    t.date "contract_until"
    t.integer "age"
    t.date "appointed"
    t.string "preferred_formation"
    t.float "avrg_coach_term"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "club_id"
    t.string "country"
    t.string "last_club"
    t.text "achievements"
    t.index ["club_id"], name: "index_coaches_on_club_id"
  end

  create_table "homes", force: :cascade do |t|
    t.integer "tour"
    t.string "home_team"
    t.string "result"
    t.string "away_team"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tournament_id"
    t.datetime "match_date"
    t.index ["tournament_id"], name: "index_homes_on_tournament_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.integer "number"
    t.integer "age"
    t.string "country"
    t.date "contract_until"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "market_value"
    t.string "cost_type"
    t.integer "club_id"
    t.integer "team"
    t.index ["club_id"], name: "index_players_on_club_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "club"
    t.integer "points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "place"
  end

  add_foreign_key "aways", "tournaments"
  add_foreign_key "coaches", "clubs"
  add_foreign_key "homes", "tournaments"
  add_foreign_key "players", "clubs"
end
