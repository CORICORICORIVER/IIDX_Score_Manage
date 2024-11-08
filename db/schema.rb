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

ActiveRecord::Schema[7.1].define(version: 2024_09_11_094709) do
  create_table "memos", force: :cascade do |t|
    t.integer "raderval_id"
    t.integer "user_id"
    t.string "version"
    t.string "title"
    t.string "genre"
    t.string "playcount"
    t.string "difficulty"
    t.integer "exscore"
    t.float "notes"
    t.float "chord"
    t.float "peak"
    t.float "charge"
    t.float "scratch"
    t.float "soflan"
    t.float "notes_growth_rate"
    t.float "chord_growth_rate"
    t.float "peak_growth_rate"
    t.float "charge_growth_rate"
    t.float "scratch_growth_rate"
    t.float "soflan_growth_rate"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "radervals", force: :cascade do |t|
    t.string "title"
    t.float "notesval"
    t.float "chordval"
    t.float "peakval"
    t.float "chargeval"
    t.float "scratchval"
    t.float "soflanval"
    t.integer "maxscore"
    t.float "l_notesval"
    t.float "l_chordval"
    t.float "l_peakval"
    t.float "l_chargeval"
    t.float "l_scratchval"
    t.float "l_soflanval"
    t.integer "l_maxscore"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: ""
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
