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

ActiveRecord::Schema.define(version: 2019_02_06_063442) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "receipt_services", force: :cascade do |t|
    t.integer "receipt_id", null: false
    t.integer "service_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receipt_id"], name: "index_receipt_services_on_receipt_id"
    t.index ["service_id"], name: "index_receipt_services_on_service_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.integer "technician_id", null: false
    t.boolean "cash", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["technician_id"], name: "index_receipts_on_technician_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_services_on_name", unique: true
  end

  create_table "technicians", force: :cascade do |t|
    t.string "name", null: false
    t.string "pin_number", null: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_technicians_on_name", unique: true
  end

end
