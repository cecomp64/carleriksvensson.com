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

ActiveRecord::Schema.define(version: 20141111012953) do

  create_table "images", force: true do |t|
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "kind"
    t.string   "url"
    t.string   "picture"
    t.text     "description",      limit: 255
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "primary_image_id"
  end

  create_table "resume_items", force: true do |t|
    t.string   "job_title"
    t.date     "start"
    t.date     "end"
    t.text     "description"
    t.string   "location"
    t.integer  "resume_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resumes", force: true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "objective"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "value"
    t.integer  "project_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "resume_item_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
