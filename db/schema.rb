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

ActiveRecord::Schema.define(version: 20170408150518) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"

  create_table "admins", force: :cascade do |t|
    t.string   "username"
    t.string   "password_hash"
    t.string   "salt"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "edit_sites", force: :cascade do |t|
    t.text     "user_name"
    t.text     "user_email"
    t.text     "site_updates"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "links", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.text     "description"
    t.string   "tag"
    t.string   "page"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "zip"
    t.text     "description"
    t.string   "contact"
    t.string   "phone"
    t.string   "email"
    t.string   "url"
    t.string   "class_resource"
    t.string   "site_type"
    t.string   "happening_now"
    t.text     "notes"
    t.string   "region"
    t.string   "summer_classes"
    t.text     "students_served"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "state"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "markers_url"
  end

  create_table "submit_sites", force: :cascade do |t|
    t.text     "user_name"
    t.text     "user_email"
    t.text     "site_name"
    t.text     "site_address"
    t.text     "site_contact"
    t.text     "site_url"
    t.text     "site_description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "volunteer_sites", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "level"
    t.string   "contact"
    t.text     "description"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.float    "latitude"
    t.float    "longitude"
  end

end
