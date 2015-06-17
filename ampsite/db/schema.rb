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

ActiveRecord::Schema.define(version: 20150617184850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ampmodels", force: :cascade do |t|
    t.integer  "manufacturer_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "post_id",    null: false
    t.string   "content",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "datasheets", force: :cascade do |t|
    t.string   "url"
    t.integer  "tube_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diodes", force: :cascade do |t|
    t.string   "identifier",               null: false
    t.string   "classification",           null: false
    t.string   "filament_voltage",         null: false
    t.string   "filament_current",         null: false
    t.string   "max_peak_inverse_voltage", null: false
    t.string   "voltage_drop",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pentodes", force: :cascade do |t|
    t.string   "identifier",            null: false
    t.string   "classification",        null: false
    t.integer  "filament_voltage",      null: false
    t.integer  "filament_current",      null: false
    t.integer  "max_anode_voltage",     null: false
    t.integer  "anode_dissipation",     null: false
    t.integer  "max_grid2_voltage",     null: false
    t.integer  "max_grid2_dissipation", null: false
    t.integer  "amplification_factor",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "topics", force: :cascade do |t|
    t.string   "title",       null: false
    t.string   "description", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "triodes", force: :cascade do |t|
    t.string   "identifier",           null: false
    t.string   "classification",       null: false
    t.integer  "filament_voltage",     null: false
    t.integer  "filament_current",     null: false
    t.integer  "max_anode_voltage",    null: false
    t.integer  "anode_dissipation",    null: false
    t.integer  "amplification_factor", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                               null: false
    t.string   "username",                            null: false
    t.string   "password_digest",                     null: false
    t.string   "location"
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
