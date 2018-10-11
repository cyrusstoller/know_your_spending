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

ActiveRecord::Schema.define(version: 20171115220323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "plaid_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string "transaction_id"
    t.string "plaid_account_id"
    t.string "category"
    t.string "plaid_category_id"
    t.string "transaction_type"
    t.decimal "amount"
    t.date "date_of_transaction"
    t.boolean "pending"
    t.string "location_address"
    t.string "location_city"
    t.string "location_state"
    t.string "location_zip"
    t.decimal "location_lat"
    t.decimal "location_lon"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["date_of_transaction"], name: "index_transactions_on_date_of_transaction"
    t.index ["plaid_category_id"], name: "index_transactions_on_plaid_category_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "user_to_categories", force: :cascade do |t|
    t.integer "user_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_user_to_categories_on_category_id"
    t.index ["user_id"], name: "index_user_to_categories_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "plaid_access_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "institution_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
