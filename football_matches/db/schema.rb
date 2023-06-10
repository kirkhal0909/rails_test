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

ActiveRecord::Schema[7.0].define(version: 2023_06_09_292310) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.datetime "time_start"
    t.integer "team1_id"
    t.integer "team2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team1_id", "team2_id"], name: "index_matches_on_team1_id_and_team2_id", where: "(team1_id <> team2_id)"
  end

  create_table "player_metrics", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "match_id", null: false
    t.float "kilometers_run", default: 0.0
    t.integer "passes", default: 0
    t.integer "passes_success", default: 0
    t.integer "goals", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "factors", default: {}, null: false
    t.index ["match_id"], name: "index_player_metrics_on_match_id"
    t.index ["player_id", "match_id"], name: "index_player_metrics_on_player_id_and_match_id", unique: true
    t.index ["player_id"], name: "index_player_metrics_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "full_name"
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "matches", "teams", column: "team1_id"
  add_foreign_key "matches", "teams", column: "team2_id"
  add_foreign_key "player_metrics", "matches"
  add_foreign_key "player_metrics", "players"
  add_foreign_key "players", "teams"
end
