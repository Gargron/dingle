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

ActiveRecord::Schema.define(:version => 20130311225334) do

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "kudos", :force => true do |t|
    t.integer  "user_id"
    t.integer  "rating_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "provider_suggestions", :force => true do |t|
    t.integer  "country_id"
    t.string   "name"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "accepted",   :default => false
  end

  create_table "providers", :force => true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.float    "overall",     :default => 0.0
    t.float    "privacy",     :default => 0.0
    t.float    "support",     :default => 0.0
    t.float    "stability",   :default => 0.0
    t.float    "price_value", :default => 0.0
    t.float    "score",       :default => 0.0
  end

  add_index "providers", ["score"], :name => "index_providers_on_score"

  create_table "ratings", :force => true do |t|
    t.integer  "provider_id"
    t.integer  "privacy"
    t.integer  "stability"
    t.integer  "support"
    t.integer  "price_value"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.float    "overall"
    t.integer  "kudos_num"
  end

  create_table "reviews", :force => true do |t|
    t.text     "content"
    t.integer  "rating_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "ip"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "password_digest"
    t.integer  "role",            :default => 0
    t.string   "email"
  end

end
