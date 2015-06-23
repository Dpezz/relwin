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

ActiveRecord::Schema.define(version: 20150623180302) do

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

  create_table "prices", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "costo",      limit: 4
    t.integer  "venta",      limit: 4
    t.integer  "margen",     limit: 4
    t.integer  "iva",        limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "prices", ["product_id"], name: "index_prices_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "barcode",     limit: 255
    t.string   "name",        limit: 255
    t.integer  "stock",       limit: 4
    t.integer  "provider_id", limit: 4
    t.integer  "category_id", limit: 4
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
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

  create_table "taxes", force: :cascade do |t|
    t.integer  "product_id",  limit: 4
    t.string   "name",        limit: 255
    t.integer  "cantidad",    limit: 4
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "taxes", ["product_id"], name: "index_taxes_on_product_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",           null: false
    t.string   "encrypted_password",     limit: 255, default: "",           null: false
    t.string   "username",               limit: 255, default: "",           null: false
    t.string   "permission_level",       limit: 255, default: "ROLE_ADMIN", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,            null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "categories", "users"
  add_foreign_key "clients", "users"
  add_foreign_key "prices", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "providers"
  add_foreign_key "products", "users"
  add_foreign_key "providers", "users"
  add_foreign_key "taxes", "products"
end
