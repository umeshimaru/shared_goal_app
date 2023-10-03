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

ActiveRecord::Schema.define(version: 2023_09_28_145303) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "monthly_goals", force: :cascade do |t|
    t.string "monthly_goal"
    t.date "goal_achieved_at"
    t.string "penalty_name"
    t.string "image"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_monthly_goals_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "task"
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "weekly_goal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["weekly_goal_id"], name: "index_tasks_on_weekly_goal_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "admin", default: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "confirmed_at"
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weekly_goals", force: :cascade do |t|
    t.string "weekly_goal"
    t.datetime "start_time"
    t.bigint "user_id", null: false
    t.bigint "monthly_goal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["monthly_goal_id"], name: "index_weekly_goals_on_monthly_goal_id"
    t.index ["user_id"], name: "index_weekly_goals_on_user_id"
  end

  add_foreign_key "monthly_goals", "users"
  add_foreign_key "tasks", "weekly_goals"
  add_foreign_key "weekly_goals", "monthly_goals"
  add_foreign_key "weekly_goals", "users"
end
