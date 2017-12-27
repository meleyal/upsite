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

ActiveRecord::Schema.define(version: 20171227102605) do

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

  create_table "invites", force: :cascade do |t|
    t.string   "token"
    t.string   "recipient_email"
    t.integer  "sender_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "invites", ["sender_id"], name: "index_invites_on_sender_id", using: :btree

  create_table "sites", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "subdomain"
    t.string   "domain"
    t.string   "color"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.jsonb    "settings",    default: {}, null: false
    t.integer  "owner_id"
  end

  add_index "sites", ["settings"], name: "index_sites_on_settings", using: :gin
  add_index "sites", ["subdomain"], name: "index_sites_on_subdomain", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invite_id"
    t.datetime "last_login_at"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["invite_id"], name: "index_users_on_invite_id", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
