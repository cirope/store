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

ActiveRecord::Schema.define(version: 20140305181654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name",                     null: false
    t.string   "subdomain",                null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "kind",                         null: false
    t.string   "flow",                         null: false
    t.integer  "last_used_number", default: 0, null: false
    t.integer  "organization_id",              null: false
    t.integer  "account_id",                   null: false
    t.integer  "lock_version",     default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books", ["account_id"], name: "index_books_on_account_id", using: :btree
  add_index "books", ["organization_id"], name: "index_books_on_organization_id", using: :btree

  create_table "cities", force: true do |t|
    t.string   "name",                     null: false
    t.string   "zip_code",                 null: false
    t.integer  "state_id",                 null: false
    t.integer  "account_id",               null: false
    t.integer  "lock_version", default: 0, null: false
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
    t.string   "email"
    t.string   "tax_condition",    null: false
    t.text     "address"
    t.integer  "invoiceable_id"
    t.string   "invoiceable_type"
    t.integer  "city_id",          null: false
    t.integer  "account_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entities", ["account_id"], name: "index_entities_on_account_id", using: :btree
  add_index "entities", ["city_id"], name: "index_entities_on_city_id", using: :btree
  add_index "entities", ["invoiceable_id", "invoiceable_type"], name: "index_entities_on_invoiceable_id_and_invoiceable_type", using: :btree
  add_index "entities", ["name"], name: "index_entities_on_name", using: :btree
  add_index "entities", ["tax_id"], name: "index_entities_on_tax_id", using: :btree

  create_table "invoice_items", force: true do |t|
    t.integer  "item_id"
    t.decimal  "quantity",   precision: 10, scale: 2, null: false
    t.decimal  "price",      precision: 15, scale: 2, null: false
    t.integer  "invoice_id",                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoice_items", ["invoice_id"], name: "index_invoice_items_on_invoice_id", using: :btree
  add_index "invoice_items", ["item_id"], name: "index_invoice_items_on_item_id", using: :btree

  create_table "invoices", force: true do |t|
    t.integer  "number",                   null: false
    t.integer  "customer_id",              null: false
    t.integer  "book_id",                  null: false
    t.integer  "account_id",               null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoices", ["account_id"], name: "index_invoices_on_account_id", using: :btree
  add_index "invoices", ["book_id"], name: "index_invoices_on_book_id", using: :btree
  add_index "invoices", ["customer_id"], name: "index_invoices_on_customer_id", using: :btree
  add_index "invoices", ["number"], name: "index_invoices_on_number", using: :btree

  create_table "items", force: true do |t|
    t.string   "code"
    t.string   "name",                                              null: false
    t.decimal  "price",        precision: 15, scale: 2,             null: false
    t.string   "unit",                                              null: false
    t.integer  "account_id",                                        null: false
    t.integer  "lock_version",                          default: 0, null: false
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

  create_table "providers", force: true do |t|
    t.integer  "account_id",               null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "providers", ["account_id"], name: "index_providers_on_account_id", using: :btree

  create_table "purchase_items", force: true do |t|
    t.integer  "item_id",                              null: false
    t.string   "unit",                                 null: false
    t.decimal  "quantity",    precision: 10, scale: 2, null: false
    t.decimal  "price",       precision: 15, scale: 2
    t.integer  "purchase_id",                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchase_items", ["item_id"], name: "index_purchase_items_on_item_id", using: :btree
  add_index "purchase_items", ["purchase_id"], name: "index_purchase_items_on_purchase_id", using: :btree

  create_table "purchases", force: true do |t|
    t.integer  "number",                   null: false
    t.date     "requested_at",             null: false
    t.date     "delivered_at"
    t.integer  "book_id",                  null: false
    t.integer  "provider_id",              null: false
    t.integer  "maker_id",                 null: false
    t.integer  "receiver_id"
    t.integer  "account_id",               null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchases", ["account_id"], name: "index_purchases_on_account_id", using: :btree
  add_index "purchases", ["book_id"], name: "index_purchases_on_book_id", using: :btree
  add_index "purchases", ["delivered_at"], name: "index_purchases_on_delivered_at", using: :btree
  add_index "purchases", ["maker_id"], name: "index_purchases_on_maker_id", using: :btree
  add_index "purchases", ["number"], name: "index_purchases_on_number", using: :btree
  add_index "purchases", ["provider_id"], name: "index_purchases_on_provider_id", using: :btree
  add_index "purchases", ["receiver_id"], name: "index_purchases_on_receiver_id", using: :btree

  create_table "receipt_items", force: true do |t|
    t.integer  "item_id",                             null: false
    t.decimal  "quantity",   precision: 10, scale: 2, null: false
    t.integer  "receipt_id",                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "receipt_items", ["item_id"], name: "index_receipt_items_on_item_id", using: :btree
  add_index "receipt_items", ["receipt_id"], name: "index_receipt_items_on_receipt_id", using: :btree

  create_table "receipts", force: true do |t|
    t.integer  "number",                   null: false
    t.integer  "customer_id",              null: false
    t.integer  "book_id",                  null: false
    t.integer  "account_id",               null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "receipts", ["account_id"], name: "index_receipts_on_account_id", using: :btree
  add_index "receipts", ["book_id"], name: "index_receipts_on_book_id", using: :btree
  add_index "receipts", ["customer_id"], name: "index_receipts_on_customer_id", using: :btree
  add_index "receipts", ["number"], name: "index_receipts_on_number", using: :btree

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
    t.string   "name",                     null: false
    t.integer  "account_id",               null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["account_id"], name: "index_states_on_account_id", using: :btree

  create_table "supplies", force: true do |t|
    t.decimal  "quantity",     precision: 10, scale: 2, null: false
    t.integer  "item_id",                               null: false
    t.integer  "warehouse_id",                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "supplies", ["item_id"], name: "index_supplies_on_item_id", using: :btree
  add_index "supplies", ["warehouse_id"], name: "index_supplies_on_warehouse_id", using: :btree

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

  create_table "warehouses", force: true do |t|
    t.string   "name",                     null: false
    t.integer  "account_id",               null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "warehouses", ["account_id"], name: "index_warehouses_on_account_id", using: :btree

end
