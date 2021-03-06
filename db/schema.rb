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

ActiveRecord::Schema.define(version: 20130825123959) do

  create_table "customers", force: true do |t|
    t.date     "end_subscription"
    t.integer  "max_vehicles"
    t.integer  "take_over"
    t.integer  "store_id"
    t.integer  "job_geocoding_id"
    t.integer  "job_matrix_id"
    t.integer  "job_optimizer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["job_geocoding_id"], name: "index_customers_on_job_geocoding_id"
  add_index "customers", ["job_matrix_id"], name: "index_customers_on_job_matrix_id"
  add_index "customers", ["job_optimizer_id"], name: "index_customers_on_job_optimizer_id"
  add_index "customers", ["store_id"], name: "index_customers_on_store_id"

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.integer  "progress",   default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "destinations", force: true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "postalcode"
    t.string   "city"
    t.float    "lat"
    t.float    "lng"
    t.integer  "quantity"
    t.time     "open"
    t.time     "close"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "destinations", ["customer_id"], name: "index_destinations_on_customer_id"

  create_table "destinations_tags", id: false, force: true do |t|
    t.integer "destination_id"
    t.integer "tag_id"
  end

  create_table "layers", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "attribution"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plannings", force: true do |t|
    t.string   "name"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plannings", ["customer_id"], name: "index_plannings_on_customer_id"

  create_table "plannings_tags", id: false, force: true do |t|
    t.integer "planning_id"
    t.integer "tag_id"
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories"

  create_table "routes", force: true do |t|
    t.float    "distance"
    t.float    "emission"
    t.integer  "planning_id"
    t.boolean  "out_of_date"
    t.integer  "vehicle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "start"
    t.time     "end"
    t.boolean  "hidden"
    t.boolean  "locked"
  end

  add_index "routes", ["planning_id"], name: "index_routes_on_planning_id"
  add_index "routes", ["vehicle_id"], name: "index_routes_on_vehicle_id"

  create_table "stops", force: true do |t|
    t.integer  "index"
    t.boolean  "active"
    t.time     "begin"
    t.time     "end"
    t.float    "distance"
    t.text     "trace"
    t.integer  "route_id"
    t.integer  "destination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "time"
  end

  add_index "stops", ["destination_id"], name: "index_stops_on_destination_id"
  add_index "stops", ["route_id"], name: "index_stops_on_route_id"

  create_table "tags", force: true do |t|
    t.string   "label"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["customer_id"], name: "index_tags_on_customer_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin"
    t.integer  "customer_id"
    t.integer  "layer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vehicles", force: true do |t|
    t.string   "name"
    t.float    "emission"
    t.float    "consumption"
    t.integer  "capacity"
    t.string   "color"
    t.time     "open"
    t.time     "close"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicles", ["customer_id"], name: "index_vehicles_on_customer_id"

end
