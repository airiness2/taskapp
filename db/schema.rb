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

ActiveRecord::Schema.define(version: 2019_08_19_064047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groupings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_groupings_on_group_id"
    t.index ["user_id"], name: "index_groupings_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "info"
    t.integer "owner_id"
    t.bigint "grouping_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grouping_id"], name: "index_groups_on_grouping_id"
  end

  create_table "labelings", force: :cascade do |t|
    t.integer "task_id"
    t.integer "label_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_labels_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name", null: false
    t.string "detail", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "endtime", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "status"
    t.integer "priority", default: 0, null: false
    t.integer "user_id"
    t.boolean "read", default: false, null: false
    t.index ["name"], name: "index_tasks_on_name"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.bigint "grouping_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["grouping_id"], name: "index_users_on_grouping_id"
  end

  add_foreign_key "groups", "groupings"
  add_foreign_key "labels", "users"
end
