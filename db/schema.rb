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

ActiveRecord::Schema.define(version: 20160925231909) do

  create_table "bookings", force: :cascade do |t|
    t.date     "b_date"
    t.time     "from_time"
    t.time     "to_time"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "room_id"
    t.index ["room_id"], name: "index_bookings_on_room_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer  "room_no"
    t.integer  "size"
    t.string   "lib_name"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "track_bookings", force: :cascade do |t|
    t.string   "full_name"
    t.string   "email"
    t.integer  "room_no"
    t.integer  "size"
    t.string   "lib_name"
    t.date     "b_date"
    t.time     "from_time"
    t.time     "to_time"
    t.string   "status"
    t.integer  "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "booked_by"
  end

  create_table "users", force: :cascade do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "password"
    t.string   "password_confirm"
    t.integer  "can_book"
    t.boolean  "admin",            default: false
    t.integer  "usertype"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "password_digest"
    t.boolean  "check"
  end

end
