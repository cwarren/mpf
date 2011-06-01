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

ActiveRecord::Schema.define(:version => 20110601171729) do

  create_table "mobile_services", :force => true do |t|
    t.string   "title",         :default => "service default title"
    t.text     "description",   :default => "service default description"
    t.string   "icon",          :default => ""
    t.string   "url",           :default => "",                            :null => false
    t.boolean  "is_live",       :default => false
    t.boolean  "is_restricted", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_packages", :force => true do |t|
    t.string   "title",       :default => "package default title"
    t.string   "urlname",     :default => "defurlname"
    t.text     "description", :default => "package default description"
    t.string   "icon",        :default => ""
    t.boolean  "is_live",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
