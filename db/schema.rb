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

ActiveRecord::Schema.define(version: 20140817181454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: true do |t|
    t.integer  "page_id"
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "name"
    t.string   "subdomain"
    t.text     "settings"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["subdomain"], name: "index_pages_on_subdomain", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["page_id"], name: "index_users_on_page_id", using: :btree

  create_table "widgets", force: true do |t|
    t.string   "type"
    t.integer  "sort_order"
    t.text     "data"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "widgets", ["page_id"], name: "index_widgets_on_page_id", using: :btree

end
