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

ActiveRecord::Schema.define(version: 20151209003357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.text     "title"
    t.integer  "releaseDate"
    t.text     "genre"
    t.integer  "amountSold"
    t.integer  "billboard200Peak"
    t.integer  "numberOfSingles"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "artists_id"
  end

  add_index "albums", ["artists_id"], name: "index_albums_on_artists_id", using: :btree

  create_table "artists", force: :cascade do |t|
    t.text     "name"
    t.integer  "age"
    t.text     "homeCountry"
    t.text     "homeState"
    t.text     "gender"
    t.text     "race"
    t.integer  "debutYear"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "labels_id"
  end

  add_index "artists", ["labels_id"], name: "index_artists_on_labels_id", using: :btree

  create_table "awards", force: :cascade do |t|
    t.text     "title"
    t.text     "event"
    t.date     "dateAwarded"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "labels", force: :cascade do |t|
    t.text     "name"
    t.text     "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.text     "title"
    t.integer  "billboardHot100Peak"
    t.integer  "radioPlayPeak"
    t.integer  "spotifyStreams"
    t.boolean  "hasMusicVideo"
    t.boolean  "isSingle"
    t.integer  "amountSold"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "artists_id"
    t.integer  "albums_id"
  end

  add_index "songs", ["albums_id"], name: "index_songs_on_albums_id", using: :btree
  add_index "songs", ["artists_id"], name: "index_songs_on_artists_id", using: :btree

end
