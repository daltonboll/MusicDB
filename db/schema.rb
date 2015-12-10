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

ActiveRecord::Schema.define(version: 20151210024255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.text     "title"
    t.integer  "amountSold"
    t.integer  "billboard200Peak"
    t.integer  "numberOfSingles"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "artist_id"
    t.string   "genres",               default: [],              array: true
    t.string   "images",               default: [],              array: true
    t.integer  "popularity",           default: 0
    t.string   "spotifyID"
    t.string   "releaseDate"
    t.string   "albumType"
    t.string   "releaseDatePrecision"
    t.string   "spotifyArtistID"
  end

  add_index "albums", ["artist_id"], name: "index_albums_on_artist_id", using: :btree

  create_table "artists", force: :cascade do |t|
    t.text     "name"
    t.integer  "age"
    t.text     "homeCountry"
    t.text     "homeState"
    t.text     "gender"
    t.text     "race"
    t.integer  "debutYear"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "label_id"
    t.string   "images",      default: [],              array: true
    t.string   "genres",      default: [],              array: true
    t.integer  "popularity",  default: 0
    t.string   "spotifyID"
  end

  add_index "artists", ["label_id"], name: "index_artists_on_label_id", using: :btree

  create_table "awards", force: :cascade do |t|
    t.text     "title"
    t.text     "event"
    t.date     "dateAwarded"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "artist_id"
    t.integer  "album_id"
  end

  add_index "awards", ["album_id"], name: "index_awards_on_album_id", using: :btree
  add_index "awards", ["artist_id"], name: "index_awards_on_artist_id", using: :btree

  create_table "labels", force: :cascade do |t|
    t.text     "name"
    t.text     "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quantone_artists", force: :cascade do |t|
    t.string   "quantoneID"
    t.string   "stageName"
    t.string   "artistType"
    t.string   "gender"
    t.string   "imageID"
    t.string   "spotifyID"
    t.integer  "birthYear"
    t.string   "birthPlace"
    t.integer  "deathYear"
    t.string   "deathPlace"
    t.string   "legalName"
    t.integer  "age"
    t.string   "homeCountry"
    t.string   "homeRegion"
    t.string   "race"
    t.integer  "debutYear"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "songs", force: :cascade do |t|
    t.text     "title"
    t.integer  "billboardHot100Peak"
    t.integer  "radioPlayPeak"
    t.integer  "spotifyStreams"
    t.boolean  "hasMusicVideo"
    t.boolean  "isSingle"
    t.integer  "amountSold"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "artist_id"
    t.integer  "album_id"
    t.integer  "popularity",          default: 0
    t.string   "spotifyID"
  end

  add_index "songs", ["album_id"], name: "index_songs_on_album_id", using: :btree
  add_index "songs", ["artist_id"], name: "index_songs_on_artist_id", using: :btree

  create_table "spotify_albums", force: :cascade do |t|
    t.string   "spotifyID"
    t.string   "albumType"
    t.string   "spotifyArtistID"
    t.string   "genres",               default: [],              array: true
    t.string   "images",               default: [],              array: true
    t.string   "title"
    t.integer  "popularity"
    t.string   "releaseDate"
    t.string   "releaseDatePrecision"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "spotify_artists", force: :cascade do |t|
    t.string   "name"
    t.string   "spotifyID"
    t.string   "images",     default: [],              array: true
    t.integer  "popularity"
    t.string   "genres",     default: [],              array: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "spotify_songs", force: :cascade do |t|
    t.string   "spotifyID"
    t.string   "spotifyAlbumID"
    t.string   "spotifyArtistID"
    t.integer  "discNumber"
    t.integer  "durationMS"
    t.boolean  "explicit"
    t.string   "title"
    t.integer  "popularity"
    t.integer  "trackNumber"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
