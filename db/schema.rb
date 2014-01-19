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

ActiveRecord::Schema.define(version: 20140117010129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name",                     null: false
    t.string   "subdomain",                null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "name",       null: false
    t.string   "zip_code",   null: false
    t.integer  "state_id",   null: false
    t.integer  "account_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["account_id"], name: "index_cities_on_account_id", using: :btree
  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "customers", force: true do |t|
    t.integer  "account_id",               null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["account_id"], name: "index_customers_on_account_id", using: :btree

  create_table "entities", force: true do |t|
    t.string   "tax_id",           null: false
    t.string   "name",             null: false
    t.string   "tax_condition",    null: false
    t.text     "address"
    t.integer  "city_id",          null: false
    t.integer  "invoiceable_id"
    t.string   "invoiceable_type"
    t.integer  "account_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entities", ["account_id"], name: "index_entities_on_account_id", using: :btree
  add_index "entities", ["city_id"], name: "index_entities_on_city_id", using: :btree
  add_index "entities", ["invoiceable_id", "invoiceable_type"], name: "index_entities_on_invoiceable_id_and_invoiceable_type", using: :btree
  add_index "entities", ["name"], name: "index_entities_on_name", using: :btree
  add_index "entities", ["tax_id"], name: "index_entities_on_tax_id", using: :btree

  create_table "invoices", force: true do |t|
    t.integer  "number",                      null: false
    t.integer  "customer_id"
    t.integer  "organization_id",             null: false
    t.integer  "account_id",                  null: false
    t.integer  "lock_version",    default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoices", ["account_id"], name: "index_invoices_on_account_id", using: :btree
  add_index "invoices", ["customer_id"], name: "index_invoices_on_customer_id", using: :btree
  add_index "invoices", ["number"], name: "index_invoices_on_number", using: :btree
  add_index "invoices", ["organization_id"], name: "index_invoices_on_organization_id", using: :btree

  create_table "items", force: true do |t|
    t.string   "code"
    t.string   "name",                     null: false
    t.integer  "account_id",               null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["account_id"], name: "index_items_on_account_id", using: :btree
  add_index "items", ["code"], name: "index_items_on_code", using: :btree
  add_index "items", ["name"], name: "index_items_on_name", using: :btree

  create_table "organizations", force: true do |t|
    t.integer  "account_id",               null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organizations", ["account_id"], name: "index_organizations_on_account_id", using: :btree

  create_table "relations", force: true do |t|
    t.integer  "organization_id", null: false
    t.integer  "user_id",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relations", ["organization_id", "user_id"], name: "index_relations_on_organization_id_and_user_id", unique: true, using: :btree
  add_index "relations", ["organization_id"], name: "index_relations_on_organization_id", using: :btree
  add_index "relations", ["user_id"], name: "index_relations_on_user_id", using: :btree

  create_table "states", force: true do |t|
    t.string   "name",       null: false
    t.integer  "account_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["account_id"], name: "index_states_on_account_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",                               null: false
    t.string   "lastname",                           null: false
    t.string   "email",                              null: false
    t.string   "password_digest",                    null: false
    t.integer  "account_id",                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token",                         null: false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.integer  "lock_version",           default: 0, null: false
  end

  add_index "users", ["account_id"], name: "index_users_on_account_id", using: :btree
  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["password_reset_token"], name: "index_users_on_password_reset_token", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.integer  "item_id",    null: false
    t.string   "item_type",  null: false
    t.integer  "account_id"
    t.string   "event",      null: false
    t.integer  "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["account_id"], name: "index_versions_on_account_id", using: :btree
  add_index "versions", ["item_id", "item_type"], name: "index_versions_on_item_id_and_item_type", using: :btree

end
