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

ActiveRecord::Schema.define(:version => 20120411212836) do

  create_table "comics", :force => true do |t|
    t.string   "domain"
    t.string   "reddit_id"
    t.integer  "score"
    t.boolean  "nsfw"
    t.integer  "downs"
    t.string   "reddit_url"
    t.string   "title"
    t.datetime "submitted_at"
    t.integer  "ups"
    t.string   "comic_strip_file_name"
    t.string   "comic_strip_content_type"
    t.integer  "comic_strip_file_size"
    t.datetime "comic_strip_updated_at"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "comics", ["reddit_id"], :name => "index_comics_on_reddit_id", :unique => true

end
