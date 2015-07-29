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

ActiveRecord::Schema.define(version: 20150729025436) do

  create_table "buys", force: :cascade do |t|
    t.datetime "date"
    t.integer  "price",      limit: 4
    t.integer  "ticket_id",  limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "buys", ["ticket_id"], name: "index_buys_on_ticket_id", using: :btree
  add_index "buys", ["user_id"], name: "index_buys_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "categories", ["user_id"], name: "index_categories_on_user_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "rut",        limit: 255
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.string   "phone",      limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "clients", ["user_id"], name: "index_clients_on_user_id", using: :btree

  create_table "in_buys", force: :cascade do |t|
    t.integer  "buy_id",     limit: 4
    t.integer  "product_id", limit: 4
    t.integer  "unit",       limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "in_buys", ["buy_id"], name: "index_in_buys_on_buy_id", using: :btree
  add_index "in_buys", ["product_id"], name: "index_in_buys_on_product_id", using: :btree

  create_table "in_orders", force: :cascade do |t|
    t.integer  "order_id",   limit: 4
    t.integer  "product_id", limit: 4
    t.integer  "unit_o",     limit: 4
    t.integer  "unit_r",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "in_orders", ["order_id"], name: "index_in_orders_on_order_id", using: :btree
  add_index "in_orders", ["product_id"], name: "index_in_orders_on_product_id", using: :btree

  create_table "in_stocks", force: :cascade do |t|
    t.integer  "stock_id",   limit: 4
    t.integer  "product_id", limit: 4
    t.integer  "unit",       limit: 4
    t.integer  "limit",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "in_stocks", ["product_id"], name: "index_in_stocks_on_product_id", using: :btree
  add_index "in_stocks", ["stock_id"], name: "index_in_stocks_on_stock_id", using: :btree

  create_table "in_taxes", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "tax_id",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "in_taxes", ["product_id"], name: "index_in_taxes_on_product_id", using: :btree
  add_index "in_taxes", ["tax_id"], name: "index_in_taxes_on_tax_id", using: :btree

  create_table "in_terminals", force: :cascade do |t|
    t.integer  "terminal_id", limit: 4
    t.integer  "vendor_id",   limit: 4
    t.integer  "start_p",     limit: 4
    t.integer  "total_p",     limit: 4
    t.integer  "end_p",       limit: 4
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "is_active",   limit: 1
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "in_terminals", ["terminal_id"], name: "index_in_terminals_on_terminal_id", using: :btree
  add_index "in_terminals", ["vendor_id"], name: "index_in_terminals_on_vendor_id", using: :btree

  create_table "in_vendors", force: :cascade do |t|
    t.integer  "vendor_id",  limit: 4
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "is_active",  limit: 1
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "in_vendors", ["user_id"], name: "index_in_vendors_on_user_id", using: :btree
  add_index "in_vendors", ["vendor_id"], name: "index_in_vendors_on_vendor_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "sale_id",    limit: 4
    t.integer  "unit",       limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "items", ["product_id"], name: "index_items_on_product_id", using: :btree
  add_index "items", ["sale_id"], name: "index_items_on_sale_id", using: :btree

  create_table "measures", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "symbol",      limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.integer  "status_id",  limit: 4
    t.integer  "price",      limit: 4
    t.integer  "ticket_id",  limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "orders", ["status_id"], name: "index_orders_on_status_id", using: :btree
  add_index "orders", ["ticket_id"], name: "index_orders_on_ticket_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "pays", force: :cascade do |t|
    t.integer  "sale_id",        limit: 4
    t.integer  "in_terminal_id", limit: 4
    t.integer  "payment_id",     limit: 4
    t.string   "code",           limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "pays", ["in_terminal_id"], name: "index_pays_on_in_terminal_id", using: :btree
  add_index "pays", ["payment_id"], name: "index_pays_on_payment_id", using: :btree
  add_index "pays", ["sale_id"], name: "index_pays_on_sale_id", using: :btree

  create_table "prices", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "buy_p",      limit: 4
    t.integer  "sale_p",     limit: 4
    t.integer  "total_p",    limit: 4
    t.integer  "return",     limit: 4
    t.integer  "taxes",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "prices", ["product_id"], name: "index_prices_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "barcode",     limit: 255
    t.string   "name",        limit: 255
    t.integer  "measure_id",  limit: 4
    t.integer  "provider_id", limit: 4
    t.integer  "category_id", limit: 4
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["measure_id"], name: "index_products_on_measure_id", using: :btree
  add_index "products", ["provider_id"], name: "index_products_on_provider_id", using: :btree
  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "providers", force: :cascade do |t|
    t.string   "rut",        limit: 255
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.string   "phone",      limit: 255
    t.string   "url",        limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "providers", ["user_id"], name: "index_providers_on_user_id", using: :btree

  create_table "sales", force: :cascade do |t|
    t.integer  "desc",         limit: 4
    t.integer  "total_p",      limit: 4
    t.integer  "buy_p",        limit: 4
    t.integer  "client_id",    limit: 4
    t.integer  "in_vendor_id", limit: 4
    t.boolean  "is_active",    limit: 1
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sales", ["client_id"], name: "index_sales_on_client_id", using: :btree
  add_index "sales", ["in_vendor_id"], name: "index_sales_on_in_vendor_id", using: :btree
  add_index "sales", ["user_id"], name: "index_sales_on_user_id", using: :btree

  create_table "statuses", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "address",     limit: 255
    t.text     "description", limit: 65535
    t.boolean  "is_active",   limit: 1
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "stocks", ["user_id"], name: "index_stocks_on_user_id", using: :btree

  create_table "taxes", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "value",       limit: 4
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "terminals", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "terminals", ["user_id"], name: "index_terminals_on_user_id", using: :btree

  create_table "tickets", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.integer  "price",      limit: 4
    t.integer  "payment_id", limit: 4
    t.text     "note",       limit: 65535
    t.datetime "date"
    t.boolean  "is_active",  limit: 1
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "tickets", ["payment_id"], name: "index_tickets_on_payment_id", using: :btree
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "username",               limit: 255, default: "", null: false
    t.integer  "permission_level",       limit: 4,   default: 3,  null: false
    t.integer  "user_id",                limit: 4
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["user_id"], name: "index_users_on_user_id", using: :btree

  create_table "vendors", force: :cascade do |t|
    t.string   "rut",        limit: 255
    t.string   "name",       limit: 255
    t.string   "plastname",  limit: 255
    t.string   "mlastname",  limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "vendors", ["user_id"], name: "index_vendors_on_user_id", using: :btree

  add_foreign_key "buys", "tickets"
  add_foreign_key "buys", "users"
  add_foreign_key "categories", "users"
  add_foreign_key "clients", "users"
  add_foreign_key "in_buys", "buys"
  add_foreign_key "in_buys", "products"
  add_foreign_key "in_orders", "orders"
  add_foreign_key "in_orders", "products"
  add_foreign_key "in_stocks", "products"
  add_foreign_key "in_stocks", "stocks"
  add_foreign_key "in_taxes", "products"
  add_foreign_key "in_taxes", "taxes"
  add_foreign_key "in_terminals", "terminals"
  add_foreign_key "in_terminals", "vendors"
  add_foreign_key "in_vendors", "users"
  add_foreign_key "in_vendors", "vendors"
  add_foreign_key "items", "products"
  add_foreign_key "items", "sales"
  add_foreign_key "orders", "statuses"
  add_foreign_key "orders", "tickets"
  add_foreign_key "orders", "users"
  add_foreign_key "pays", "in_terminals"
  add_foreign_key "pays", "payments"
  add_foreign_key "pays", "sales"
  add_foreign_key "prices", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "measures"
  add_foreign_key "products", "providers"
  add_foreign_key "products", "users"
  add_foreign_key "providers", "users"
  add_foreign_key "sales", "clients"
  add_foreign_key "sales", "in_vendors"
  add_foreign_key "sales", "users"
  add_foreign_key "stocks", "users"
  add_foreign_key "terminals", "users"
  add_foreign_key "tickets", "payments"
  add_foreign_key "tickets", "users"
  add_foreign_key "users", "users"
  add_foreign_key "vendors", "users"
end
