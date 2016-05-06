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

ActiveRecord::Schema.define(version: 20160503234527) do

  create_table "users", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true

  create_table "videos", force: :cascade do |t|
    t.string   "nome"
    t.string   "video_file_file_name"
    t.string   "video_file_content_type"
    t.integer  "video_file_file_size"
    t.datetime "video_file_updated_at"
    t.string   "mp4_file_file_name"
    t.string   "mp4_file_content_type"
    t.integer  "mp4_file_file_size"
    t.datetime "mp4_file_updated_at"
    t.string   "webm_file_file_name"
    t.string   "webm_file_content_type"
    t.integer  "webm_file_file_size"
    t.datetime "webm_file_updated_at"
    t.string   "ogg_file_file_name"
    t.string   "ogg_file_content_type"
    t.integer  "ogg_file_file_size"
    t.datetime "ogg_file_updated_at"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.boolean  "published"
    t.integer  "likes",                   default: 0
    t.integer  "usuario_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "videos", ["usuario_id"], name: "index_videos_on_usuario_id"

end
