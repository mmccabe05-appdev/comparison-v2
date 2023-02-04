# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_02_04_222814) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "commenter_id"
    t.bigint "comparison_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comparison_id"], name: "index_comments_on_comparison_id"
  end

  create_table "comparisons", force: :cascade do |t|
    t.string "body"
    t.bigint "user_id", null: false
    t.integer "culinary_similarity", default: 0
    t.integer "transportation_similarity", default: 0
    t.integer "people_similarity", default: 0
    t.integer "built_environment_similarity", default: 0
    t.float "overall_similarity", default: 0.0
    t.integer "neighborhood_1_id", null: false
    t.integer "neighborhood_2_id", null: false
    t.float "net_comparison_score", default: 0.0
    t.integer "net_votes", default: 0
    t.integer "likes_count", default: 0
    t.integer "comments_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_comparisons_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "comparison_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comparison_id"], name: "index_likes_on_comparison_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.citext "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.citext "username"
    t.integer "comparisons_count", default: 0
    t.integer "favorite_neighborhoods_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "comments", "comparisons"
  add_foreign_key "comparisons", "users"
  add_foreign_key "likes", "comparisons"
  add_foreign_key "likes", "users"
end
