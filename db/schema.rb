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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140326075009) do

  create_table "cat_rental_requests", :force => true do |t|
    t.integer "cat_id",                            :null => false
    t.date    "start_date",                        :null => false
    t.date    "end_date",                          :null => false
    t.string  "status",     :default => "PENDING", :null => false
  end

  add_index "cat_rental_requests", ["cat_id"], :name => "index_cat_rental_requests_on_cat_id"

  create_table "cats", :force => true do |t|
    t.date     "birth_date", :null => false
    t.string   "color",      :null => false
    t.string   "name",       :null => false
    t.string   "sex"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id",    :null => false
    t.string   "url"
  end

  add_index "cats", ["user_id"], :name => "index_cats_on_user_id"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0, :null => false
    t.integer  "attempts",   :default => 0, :null => false
    t.text     "handler",                   :null => false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "sessions", :force => true do |t|
    t.integer  "user_id",       :null => false
    t.integer  "session_token", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "location"
  end

  add_index "sessions", ["user_id"], :name => "index_sessions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "user_name",       :null => false
    t.string   "password_digest", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["user_name"], :name => "index_users_on_user_name", :unique => true

end
