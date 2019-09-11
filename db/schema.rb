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

ActiveRecord::Schema.define(version: 2019_09_11_092920) do

  create_table "event_logs", force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_logs_on_event_id"
    t.index ["user_id"], name: "index_event_logs_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "event_name"
    t.integer "event_type"
    t.date "apply_start"
    t.date "apply_end"
    t.decimal "fee"
    t.integer "max_attend"
    t.integer "min_attend"
    t.date "event_start"
    t.date "event_end"
    t.string "event_pic"
    t.integer "event_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "uesr_id"
    t.index ["uesr_id"], name: "index_events_on_uesr_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "age"
    t.integer "gender"
    t.integer "user_level"
    t.string "mobile"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
