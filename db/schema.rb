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

ActiveRecord::Schema.define(version: 2019_08_12_190333) do

  create_table "shipping_rates", force: :cascade do |t|
    t.string "name"
    t.integer "rate_per_kilo_cents", default: 0, null: false
    t.string "rate_per_kilo_currency", default: "USD", null: false
    t.string "origin"
    t.string "destination"
    t.index ["name"], name: "index_shipping_rates_on_name"
  end

  create_table "shipping_service_providers", force: :cascade do |t|
    t.string "name"
    t.integer "flat_rate_cents", default: 0, null: false
    t.string "flat_rate_currency", default: "USD", null: false
    t.index ["name"], name: "index_shipping_service_providers_on_name"
  end

end
