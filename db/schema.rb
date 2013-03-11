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

ActiveRecord::Schema.define(:version => 20130311131811) do

  create_table "auths", :force => true do |t|
    t.integer  "client_id",    :null => false
    t.integer  "user_id",      :null => false
    t.string   "access_token", :null => false
    t.datetime "expires_at",   :null => false
    t.string   "type"
    t.string   "code"
    t.text     "scope"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "auths", ["access_token"], :name => "index_auths_on_access_token", :unique => true
  add_index "auths", ["client_id", "user_id"], :name => "index_auths_on_client_id_and_user_id", :unique => true

  create_table "clients", :force => true do |t|
    t.string   "app_id",       :null => false
    t.string   "app_secret",   :null => false
    t.string   "name",         :null => false
    t.text     "redirect_uri"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "clients", ["app_id"], :name => "index_clients_on_app_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "username",   :null => false
    t.string   "password",   :null => false
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
