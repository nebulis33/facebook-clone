# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_09_210945) do

  create_table "friendships", force: :cascade do |t|
    t.integer "requestor_id", null: false
    t.integer "requestee_id", null: false
    t.boolean "accepted", default: false
    t.boolean "denied", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["requestee_id", "requestor_id"], name: "index_friendships_on_requestee_id_and_requestor_id", unique: true
    t.index ["requestee_id"], name: "index_friendships_on_requestee_id"
    t.index ["requestor_id", "requestee_id"], name: "index_friendships_on_requestor_id_and_requestee_id", unique: true
    t.index ["requestor_id"], name: "index_friendships_on_requestor_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "body", null: false
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "friendships", "users", column: "requestee_id"
  add_foreign_key "friendships", "users", column: "requestor_id"
end
