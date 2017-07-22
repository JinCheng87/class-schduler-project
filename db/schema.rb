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

ActiveRecord::Schema.define(version: 20170721161124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_registrations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.index ["event_id"], name: "index_event_registrations_on_event_id", using: :btree
    t.index ["user_id"], name: "index_event_registrations_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.text     "title",            null: false
    t.text     "description",      null: false
    t.datetime "starts_at",        null: false
    t.datetime "ends_at",          null: false
    t.integer  "max_participants"
    t.integer  "studio_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["studio_id"], name: "index_events_on_studio_id", using: :btree
  end

  create_table "studios", force: :cascade do |t|
    t.text     "name",        null: false
    t.text     "description", null: false
    t.text     "address",     null: false
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_studios_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.text     "name",                                null: false
    t.text     "title"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
