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

ActiveRecord::Schema.define(version: 20160301144758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "artists", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists_events", id: false, force: :cascade do |t|
    t.uuid "artist_id", null: false
    t.uuid "event_id",  null: false
  end

  add_index "artists_events", ["artist_id", "event_id"], name: "index_artists_events_on_artist_id_and_event_id", unique: true, using: :btree
  add_index "artists_events", ["event_id", "artist_id"], name: "index_artists_events_on_event_id_and_artist_id", unique: true, using: :btree

  create_table "events", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "venue_id",                   null: false
    t.datetime "starts_at"
    t.integer  "price"
    t.boolean  "soldout",    default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "events", ["venue_id"], name: "index_events_on_venue_id", using: :btree

  create_table "venues", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
