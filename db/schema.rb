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

ActiveRecord::Schema.define(version: 20131021140943) do

  create_table "post_comments", force: true do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
  end

  add_index "post_comments", ["post_id"], name: "index_post_comments_on_post_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.string   "picture"
    t.integer  "user_id_id"
    t.integer  "author_id_id"
    t.integer  "author_id"
  end

  add_index "posts", ["author_id"], name: "index_posts_on_author_id", using: :btree
  add_index "posts", ["author_id_id"], name: "index_posts_on_author_id_id", using: :btree
  add_index "posts", ["user_id_id"], name: "index_posts_on_user_id_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "login"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
