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

ActiveRecord::Schema.define(version: 20160922063939) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "number"
    t.string   "street"
    t.string   "zip_code"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "owner_id"
    t.string   "owner_type"
  end

  add_index "addresses", ["owner_type", "owner_id"], name: "index_addresses_on_owner_type_and_owner_id"

  create_table "degrees", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
  end

  create_table "people_degrees", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "degree_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "people_degrees", ["degree_id"], name: "index_people_degrees_on_degree_id"
  add_index "people_degrees", ["person_id"], name: "index_people_degrees_on_person_id"

  create_table "pets", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "person_id"
  end

  add_index "pets", ["person_id"], name: "index_pets_on_person_id"

  create_table "school_degrees", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "degree_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "school_degrees", ["degree_id"], name: "index_school_degrees_on_degree_id"
  add_index "school_degrees", ["school_id"], name: "index_school_degrees_on_school_id"

  create_table "schools", force: :cascade do |t|
    t.string   "school_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
