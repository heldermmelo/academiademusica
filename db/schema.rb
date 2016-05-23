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

ActiveRecord::Schema.define(version: 20160521213900) do

  create_table "users", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.integer  "usuarios_videos_id"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true
  add_index "usuarios", ["usuarios_videos_id"], name: "index_usuarios_on_usuarios_videos_id"

  create_table "usuarios_videos", id: false, force: :cascade do |t|
    t.integer "usuario_id", null: false
    t.integer "video_id",   null: false
  end

# Could not dump table "videos" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
