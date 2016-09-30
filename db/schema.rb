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

ActiveRecord::Schema.define(version: 20160930171051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.integer  "block_id"
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blocks", force: :cascade do |t|
    t.string   "type"
    t.integer  "position"
    t.string   "title"
    t.text     "body"
    t.string   "link_url"
    t.string   "embed_url"
    t.string   "color"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blocks", ["site_id"], name: "index_blocks_on_site_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "subdomain",  limit: 255
    t.text     "settings"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "open_for_registration"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "cost_per_month"
  end

  create_table "signups", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "site_memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "site_memberships", ["site_id"], name: "index_site_memberships_on_site_id", using: :btree
  add_index "site_memberships", ["user_id"], name: "index_site_memberships_on_user_id", using: :btree

  create_table "sites", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "subdomain"
    t.string   "domain"
    t.string   "color"
    t.boolean  "featured"
    t.string   "owner_id"
    t.datetime "deleted_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "border",      default: true
  end

  add_index "sites", ["owner_id"], name: "index_sites_on_owner_id", using: :btree
  add_index "sites", ["subdomain"], name: "index_sites_on_subdomain", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "plan_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["plan_id"], name: "index_users_on_plan_id", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "widgets", force: :cascade do |t|
    t.string   "type",       limit: 255
    t.integer  "sort_order"
    t.text     "data"
    t.integer  "page_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "widgets", ["page_id"], name: "index_widgets_on_page_id", using: :btree

  add_foreign_key "site_memberships", "sites"
  add_foreign_key "site_memberships", "users"
end
