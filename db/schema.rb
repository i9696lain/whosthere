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

ActiveRecord::Schema.define(version: 20190404081146) do

  create_table "activities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "room_id"
    t.bigint "user_id"
    t.integer "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id", "created_at"], name: "index_activities_on_room_id_and_created_at"
    t.index ["room_id"], name: "index_activities_on_room_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_staying", default: false
    t.index ["room_id"], name: "index_users_on_room_id"
  end

  add_foreign_key "activities", "rooms"
  add_foreign_key "activities", "users"
  add_foreign_key "users", "rooms"
end
