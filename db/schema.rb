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

ActiveRecord::Schema.define(:version => 20150304011052) do

  create_table "blog_posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "subject"
    t.integer  "number"
    t.string   "semester"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "professor"
    t.integer  "user_id"
    t.string   "name"
    t.string   "start"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "location"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "event_type"
    t.string   "status"
  end

  create_table "events_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "event_id"
  end

  add_index "events_users", ["user_id", "event_id"], :name => "index_events_users_on_user_id_and_event_id"

  create_table "jobs", :force => true do |t|
    t.string   "job_title"
    t.string   "company_name"
    t.string   "city"
    t.text     "description"
    t.text     "requirements"
    t.string   "company_url"
    t.text     "company_description"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.date     "end_date",            :default => '2014-10-02'
  end

  create_table "notifications", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "payments", :force => true do |t|
    t.text     "params"
    t.string   "status"
    t.string   "transaction_id"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.float    "price"
    t.string   "invoice"
    t.string   "btn_id"
  end

  create_table "rsvps", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "event_id"
  end

  add_index "rsvps", ["user_id", "event_id"], :name => "index_rsvps_on_user_id_and_event_id"

# Could not dump table "users" because of following StandardError
#   Unknown type 'bool' for column 'name_tag'

end
