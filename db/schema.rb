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

ActiveRecord::Schema.define(version: 20170423141037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["receiver_id"], name: "index_chats_on_receiver_id", using: :btree
    t.index ["sender_id"], name: "index_chats_on_sender_id", using: :btree
  end

  create_table "crops", force: :cascade do |t|
    t.integer  "harvest_id"
    t.string   "type"
    t.integer  "quantity"
    t.string   "measurement_unit"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["harvest_id"], name: "index_crops_on_harvest_id", using: :btree
  end

  create_table "garden_locations", force: :cascade do |t|
    t.integer  "garden_id"
    t.integer  "garden_ownership_id"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["garden_id"], name: "index_garden_locations_on_garden_id", using: :btree
    t.index ["garden_ownership_id"], name: "index_garden_locations_on_garden_ownership_id", using: :btree
  end

  create_table "garden_ownerships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "garden_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garden_id"], name: "index_garden_ownerships_on_garden_id", using: :btree
    t.index ["user_id"], name: "index_garden_ownerships_on_user_id", using: :btree
  end

  create_table "garden_participations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "garden_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garden_id"], name: "index_garden_participations_on_garden_id", using: :btree
    t.index ["user_id"], name: "index_garden_participations_on_user_id", using: :btree
  end

  create_table "gardens", force: :cascade do |t|
    t.integer  "maximum_number_of_participants"
    t.integer  "head_gardener_id"
    t.string   "whatsapp_group_url"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["head_gardener_id"], name: "index_gardens_on_head_gardener_id", using: :btree
  end

  create_table "harvests", force: :cascade do |t|
    t.integer  "garden_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garden_id"], name: "index_harvests_on_garden_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "chat_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "garden_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garden_id"], name: "index_posts_on_garden_id", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "garden_id"
    t.text     "message"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garden_id"], name: "index_requests_on_garden_id", using: :btree
    t.index ["user_id"], name: "index_requests_on_user_id", using: :btree
  end

  create_table "user_locations", force: :cascade do |t|
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_locations_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "chats", "users", column: "receiver_id"
  add_foreign_key "chats", "users", column: "sender_id"
  add_foreign_key "crops", "harvests"
  add_foreign_key "garden_locations", "garden_ownerships"
  add_foreign_key "garden_locations", "gardens"
  add_foreign_key "garden_ownerships", "gardens"
  add_foreign_key "garden_ownerships", "users"
  add_foreign_key "garden_participations", "gardens"
  add_foreign_key "garden_participations", "users"
  add_foreign_key "gardens", "users", column: "head_gardener_id"
  add_foreign_key "harvests", "gardens"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
  add_foreign_key "posts", "gardens"
  add_foreign_key "posts", "users"
  add_foreign_key "requests", "gardens"
  add_foreign_key "requests", "users"
end
