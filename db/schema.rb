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

ActiveRecord::Schema.define(:version => 20120224191455) do

  create_table "mobile_services", :force => true do |t|
    t.string   "title",             :default => ""
    t.string   "urltitle",          :default => ""
    t.text     "description",       :default => ""
    t.string   "service_type",      :default => "embedded"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.string   "url",               :default => "",         :null => false
    t.boolean  "is_live",           :default => false
    t.boolean  "is_restricted",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_site_url"
  end

  create_table "package_memberships", :force => true do |t|
    t.integer  "package_item_id"
    t.string   "package_item_type"
    t.integer  "service_package_id"
    t.integer  "ordering"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_packages", :force => true do |t|
    t.string   "title",                 :default => ""
    t.string   "urltitle",              :default => ""
    t.text     "description"
    t.string   "display_style",         :default => "grid"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.boolean  "is_live",               :default => false
    t.boolean  "is_restricted",         :default => false
    t.boolean  "flag_show_root_link",   :default => true
    t.boolean  "flag_show_description", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_site_url"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role",       :default => "none"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
