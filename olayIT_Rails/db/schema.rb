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

ActiveRecord::Schema.define(version: 20160319234720) do

  create_table "bookings", force: :cascade do |t|
    t.integer  "tour_squad_id"
    t.date     "booking_day"
    t.boolean  "is_filled"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "categoryname"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.string   "phoneNumber"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.text     "additionalNotes"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "username"
    t.string   "password_digest"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "squad_id"
    t.float    "saleprice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "prodqty"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.date     "saledate"
    t.text     "salenotes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "squad_id"
    t.string   "squadname"
  end

  create_table "promotions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "imagepath"
    t.date     "startdate"
    t.date     "enddate"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reorders", force: :cascade do |t|
    t.integer  "squad_id"
    t.integer  "qtyorder"
    t.date     "reorderdate"
    t.date     "expecteddelivery"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "squad_id"
    t.date     "reviewdate"
    t.text     "comments"
    t.integer  "rating"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "squads", force: :cascade do |t|
    t.string   "squadname"
    t.string   "squadimage"
    t.text     "description"
    t.integer  "category_id"
    t.float    "saleprice"
    t.string   "status"
    t.float    "purchaseprice"
    t.integer  "qtyonhand"
    t.integer  "reorderpoint"
    t.integer  "reorderqty"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
