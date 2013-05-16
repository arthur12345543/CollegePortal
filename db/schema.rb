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

ActiveRecord::Schema.define(:version => 20140226112941) do

  create_table "albums", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "custom_pages", :force => true do |t|
    t.string   "name"
    t.text     "html_code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "days", :force => true do |t|
    t.text     "name"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "feedbacks", :force => true do |t|
    t.string   "email",                           :null => false
    t.string   "name_surname",                    :null => false
    t.text     "message",                         :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "served",       :default => false
  end

  create_table "forum_categories", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.text     "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "histories", :force => true do |t|
    t.text     "title"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lessons", :force => true do |t|
    t.text     "even_room",           :default => ""
    t.text     "even_lesson",         :default => ""
    t.text     "even_teacher",        :default => ""
    t.text     "odd_room",            :default => ""
    t.text     "odd_lesson",          :default => ""
    t.text     "odd_teacher",         :default => ""
    t.text     "replacement_room",    :default => ""
    t.text     "replacement_lesson",  :default => ""
    t.text     "replacement_teacher", :default => ""
    t.date     "replacement_date",    :default => '2000-01-01'
    t.boolean  "double_lesson",       :default => false
    t.integer  "day_id"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  create_table "news", :force => true do |t|
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "title"
    t.text     "text"
  end

  create_table "partners", :force => true do |t|
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "name"
    t.text     "text"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "photos", :force => true do |t|
    t.text     "description"
    t.integer  "album_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "posts", :force => true do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "theme_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string  "name"
    t.string  "information"
    t.boolean "can_add_files",         :default => true
    t.boolean "can_delete_files",      :default => true
    t.boolean "can_add_news",          :default => true
    t.boolean "can_delete_news",       :default => true
    t.boolean "can_add_showbill",      :default => true
    t.boolean "can_delete_showbill",   :default => true
    t.boolean "can_add_history",       :default => true
    t.boolean "can_delete_history",    :default => true
    t.boolean "can_post_forum",        :default => true
    t.boolean "can_admin_forum",       :default => true
    t.boolean "can_manage_albums",     :default => true
    t.boolean "can_admin_roles",       :default => true
    t.boolean "can_edit_news",         :default => false
    t.boolean "can_edit_schedule",     :default => false
    t.boolean "can_edit_partners",     :default => false
    t.boolean "can_edit_custom_pages", :default => false
    t.boolean "can_admin_feedbacks",   :default => false
  end

  create_table "sections", :force => true do |t|
    t.text     "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "showbill", :force => true do |t|
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "spud_admin_permissions", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.boolean  "access"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "scope"
  end

  create_table "spud_photo_albums", :force => true do |t|
    t.string   "title"
    t.string   "url_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "spud_photo_albums", ["url_name"], :name => "idx_album_url_name"

  create_table "spud_photo_albums_photos", :force => true do |t|
    t.integer "spud_photo_album_id"
    t.integer "spud_photo_id"
    t.integer "sort_order",          :default => 0
  end

  add_index "spud_photo_albums_photos", ["spud_photo_album_id"], :name => "idx_album_id"

  create_table "spud_photo_galleries", :force => true do |t|
    t.string   "title"
    t.string   "url_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "spud_photo_galleries", ["url_name"], :name => "idx_gallery_url_name"

  create_table "spud_photo_galleries_albums", :force => true do |t|
    t.integer "spud_photo_gallery_id"
    t.integer "spud_photo_album_id"
    t.integer "sort_order",            :default => 0
  end

  add_index "spud_photo_galleries_albums", ["spud_photo_gallery_id"], :name => "idx_gallery_id"

  create_table "spud_photos", :force => true do |t|
    t.string   "title"
    t.string   "caption"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "spud_user_settings", :force => true do |t|
    t.integer  "spud_user_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "spud_users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "super_admin"
    t.string   "login",                              :null => false
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "time_zone"
  end

  add_index "spud_users", ["email"], :name => "index_spud_users_on_email"
  add_index "spud_users", ["login"], :name => "index_spud_users_on_login"

  create_table "students", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "lessons"
  end

  create_table "teachers", :force => true do |t|
    t.date     "birthday"
    t.string   "lessons"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "themes", :force => true do |t|
    t.text     "title"
    t.integer  "section_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "uploads", :force => true do |t|
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "title"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "user_id"
    t.integer  "lesson_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.integer  "status"
    t.string   "phone"
    t.string   "country"
    t.string   "city"
    t.string   "about"
    t.string   "surname"
    t.integer  "character_id"
    t.string   "character_type"
    t.integer  "userable_id"
    t.string   "userable_type"
    t.integer  "role_id",                :default => 1
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
