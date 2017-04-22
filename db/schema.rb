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

ActiveRecord::Schema.define(version: 20170420171511) do

  create_table "example_resources", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "examples", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_lines", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "order_id"
    t.string   "type"
    t.decimal  "amount"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.decimal  "article_price"
    t.decimal  "reduction"
    t.integer  "vat_id"
    t.index ["article_id"], name: "index_order_lines_on_article_id"
    t.index ["order_id"], name: "index_order_lines_on_order_id"
    t.index ["vat_id"], name: "index_order_lines_on_vat_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "type"
    t.integer  "Supplier_id"
    t.integer  "Customer_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "name"
    t.string   "telephone"
    t.string   "email"
    t.boolean  "geleverd",     default: false
    t.boolean  "gefactureerd", default: false
    t.index ["Customer_id"], name: "index_orders_on_Customer_id"
    t.index ["Supplier_id"], name: "index_orders_on_Supplier_id"
  end

  create_table "relations", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stock_article_groups", force: :cascade do |t|
    t.string   "name"
    t.decimal  "markup"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stock_articles", force: :cascade do |t|
    t.integer  "number"
    t.string   "description"
    t.string   "specification"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "article_group_id"
    t.decimal  "purchase_price",   default: "0.0"
    t.string   "unit"
    t.integer  "vat_id",           default: 3
    t.index ["article_group_id"], name: "index_stock_articles_on_article_group_id"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vats", force: :cascade do |t|
    t.string   "description"
    t.decimal  "percentage"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
