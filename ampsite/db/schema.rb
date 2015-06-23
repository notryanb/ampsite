# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150623141426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ampmodels", force: :cascade do |t|
    t.integer  "manufacturer_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "title"
    t.string   "body",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",          null: false
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "content",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree

  create_table "datasheets", force: :cascade do |t|
    t.string   "url"
    t.integer  "tube_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diodes", force: :cascade do |t|
    t.string   "identifier",               null: false
    t.float    "max_peak_inverse_voltage"
    t.float    "voltage_drop"
    t.string   "rectifier_class"
    t.float    "rms_anode_to_anode"
    t.float    "filament_voltage"
    t.float    "filament_current"
    t.string   "pinout"
    t.string   "description"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pentodes", force: :cascade do |t|
    t.string   "identifier"
    t.float    "max_anode_voltage"
    t.float    "max_grid2_voltage"
    t.float    "max_anode_dissipation"
    t.float    "max_grid2_dissipation"
    t.float    "max_cathode_current"
    t.float    "filament_voltage"
    t.float    "filament_current"
    t.string   "pinout"
    t.string   "description"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "classification"
  end

  create_table "pinouts", force: :cascade do |t|
    t.integer  "pinoutable_id"
    t.string   "pinoutable_type"
    t.string   "description",                    null: false
    t.string   "pin_1",           default: "NC"
    t.string   "pin_2",           default: "NC"
    t.string   "pin_3",           default: "NC"
    t.string   "pin_4",           default: "NC"
    t.string   "pin_5",           default: "NC"
    t.string   "pin_6",           default: "NC"
    t.string   "pin_7",           default: "NC"
    t.string   "pin_8",           default: "NC"
    t.string   "pin_9",           default: "NC"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pinouts", ["pinoutable_type", "pinoutable_id"], name: "index_pinouts_on_pinoutable_type_and_pinoutable_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "topic_id",   null: false
    t.integer  "user_id",    null: false
    t.string   "title",      null: false
    t.string   "content",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schematics", force: :cascade do |t|
    t.string   "url"
    t.integer  "ampmodel_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tetrodes", force: :cascade do |t|
    t.string   "identifier"
    t.float    "max_anode_voltage"
    t.float    "max_grid2_voltage"
    t.float    "max_anode_dissipation"
    t.float    "max_grid2_dissipation"
    t.float    "max_cathode_current"
    t.float    "filament_voltage"
    t.float    "filament_current"
    t.string   "pinout"
    t.string   "description"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "classification"
  end

  create_table "topics", force: :cascade do |t|
    t.string   "title",       null: false
    t.string   "description", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "triodepentodes", force: :cascade do |t|
    t.string   "identifier"
    t.float    "max_triode_anode_voltage"
    t.float    "max_pentode_anode_voltage"
    t.float    "max_pentode_grid2_voltage"
    t.float    "max_triode_anode_dissipation"
    t.float    "max_pentode_anode_dissipation"
    t.float    "filament_voltage"
    t.float    "filament_current"
    t.string   "pinout"
    t.string   "description"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "triodes", force: :cascade do |t|
    t.string   "identifier",                   null: false
    t.float    "max_anode_voltage"
    t.float    "max_filament_cathode_voltage"
    t.float    "max_cathode_current"
    t.float    "anode_dissipation"
    t.float    "amplification_factor"
    t.float    "filament_voltage"
    t.float    "filament_current"
    t.string   "pinout"
    t.string   "description"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                               null: false
    t.string   "username",                            null: false
    t.string   "password_digest",                     null: false
    t.string   "location"
    t.boolean  "admin"
    t.boolean  "show_email",          default: false
    t.string   "signature"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
