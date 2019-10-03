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

ActiveRecord::Schema.define(version: 2019_09_23_231547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: :cascade do |t|
    t.string "tag"
    t.string "name"
    t.boolean "champion"
    t.boolean "unbeaten"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players_tournaments", id: false, force: :cascade do |t|
    t.bigint "tournament_id", null: false
    t.bigint "player_id", null: false
    t.index ["player_id", "tournament_id"], name: "index_players_tournaments_on_player_id_and_tournament_id"
    t.index ["tournament_id", "player_id"], name: "index_players_tournaments_on_tournament_id_and_player_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "clan_tag"
    t.string "first_place"
    t.string "second_place"
    t.string "best_streak"
    t.string "unbeaten"
    t.integer "time_per_round"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
