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

ActiveRecord::Schema.define(version: 20160525053708) do

  create_table "shoes", force: :cascade do |t|
    t.string   "shoename"
    t.string   "boxnumber"
    t.string   "shoetype"
    t.string   "color"
    t.integer  "activity"
    t.integer  "watersensitivity"
    t.integer  "odorsensitivity"
    t.integer  "predictedlife"
    t.integer  "weight"
    t.integer  "warmth"
    t.integer  "usagetime",        default: 0, null: false
    t.integer  "preference"
    t.integer  "recommendindex",   default: 0, null: false
    t.boolean  "jogging"
    t.boolean  "casual"
    t.boolean  "sports"
    t.boolean  "trip"
    t.boolean  "storll"
    t.boolean  "official"
    t.boolean  "date"
    t.boolean  "business"
    t.boolean  "soccer"
    t.boolean  "basketball"
    t.boolean  "house"
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
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
    t.string   "ipaddress"
    t.string   "city"
    t.string   "apikey"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
