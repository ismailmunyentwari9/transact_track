# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_707_051_101) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.string 'icon'
    t.integer 'author_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'details'
  end

  create_table 'categories_transactions', id: false, force: :cascade do |t|
    t.bigint 'category_id'
    t.bigint 'transaction_id'
    t.index %w[category_id transaction_id], name: 'index_categories_transactions_on_category_id_and_transaction_id', unique: true
    t.index ['category_id'], name: 'index_categories_transactions_on_category_id'
    t.index %w[transaction_id category_id], name: 'index_categories_transactions_on_transaction_id_and_category_id', unique: true
    t.index ['transaction_id'], name: 'index_categories_transactions_on_transaction_id'
  end

  create_table 'transactions', force: :cascade do |t|
    t.string 'name'
    t.decimal 'amount'
    t.integer 'author_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'confirmed_at'
    t.string 'confirmation_token'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'categories', 'users', column: 'author_id'
  add_foreign_key 'transactions', 'users', column: 'author_id'
end
