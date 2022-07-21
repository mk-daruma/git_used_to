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

ActiveRecord::Schema.define(version: 2022_07_20_081016) do

  create_table "quiz_bookmarks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "quiz_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_id"], name: "index_quiz_bookmarks_on_quiz_id"
    t.index ["user_id"], name: "index_quiz_bookmarks_on_user_id"
  end

  create_table "quiz_branches", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "quiz_branch_name"
    t.bigint "quiz_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_id"], name: "index_quiz_branches_on_quiz_id"
  end

  create_table "quiz_command_tags", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "quiz_command_tag_name"
    t.bigint "quiz_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_id"], name: "index_quiz_command_tags_on_quiz_id"
  end

  create_table "quiz_comments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "quiz_comment"
    t.bigint "quiz_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_id"], name: "index_quiz_comments_on_quiz_id"
    t.index ["user_id"], name: "index_quiz_comments_on_user_id"
  end

  create_table "quiz_commit_messages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "quiz_commit_message"
    t.bigint "quiz_branch_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_branch_id"], name: "index_quiz_commit_messages_on_quiz_branch_id"
  end

  create_table "quiz_repository_files", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "quiz_repository_file_name"
    t.string "quiz_repository_file_status"
    t.string "quiz_repository_file_text_status"
    t.bigint "quiz_commit_message_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_commit_message_id"], name: "index_quiz_repository_files_on_quiz_commit_message_id"
  end

  create_table "quiz_reviews", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.float "quiz_review"
    t.bigint "quiz_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_id"], name: "index_quiz_reviews_on_quiz_id"
    t.index ["user_id"], name: "index_quiz_reviews_on_user_id"
  end

  create_table "quiz_worktree_files", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "quiz_worktree_file_name"
    t.string "quiz_worktree_file_status"
    t.string "quiz_worktree_file_text_status"
    t.bigint "quiz_branch_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_branch_id"], name: "index_quiz_worktree_files_on_quiz_branch_id"
  end

  create_table "quizzes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "quiz_name"
    t.text "quiz_introduction"
    t.string "quiz_type"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_quizzes_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_name", default: "", null: false
    t.string "user_self_introduction", default: ""
    t.string "user_image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "quiz_bookmarks", "quizzes"
  add_foreign_key "quiz_bookmarks", "users"
  add_foreign_key "quiz_branches", "quizzes"
  add_foreign_key "quiz_command_tags", "quizzes"
  add_foreign_key "quiz_comments", "quizzes"
  add_foreign_key "quiz_comments", "users"
  add_foreign_key "quiz_commit_messages", "quiz_branches"
  add_foreign_key "quiz_repository_files", "quiz_commit_messages"
  add_foreign_key "quiz_reviews", "quizzes"
  add_foreign_key "quiz_reviews", "users"
  add_foreign_key "quiz_worktree_files", "quiz_branches"
  add_foreign_key "quizzes", "users"
end
