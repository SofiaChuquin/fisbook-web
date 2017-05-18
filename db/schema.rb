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

ActiveRecord::Schema.define(version: 20170518003703) do

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.float    "credits"
    t.string   "type_evaluation"
    t.integer  "hours"
    t.integer  "teacher_id"
    t.integer  "cycle_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["cycle_id"], name: "index_courses_on_cycle_id"
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "cycles", force: :cascade do |t|
    t.string   "name"
    t.string   "semester",   limit: 1
    t.integer  "year",       limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "demands", force: :cascade do |t|
    t.string   "subject"
    t.string   "body"
    t.string   "document"
    t.integer  "student_id"
    t.integer  "executive_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["executive_id"], name: "index_demands_on_executive_id"
    t.index ["student_id"], name: "index_demands_on_student_id"
  end

  create_table "detail_courses", force: :cascade do |t|
    t.integer  "first_practice"
    t.integer  "second_practice"
    t.integer  "third_practice"
    t.integer  "first_exam"
    t.integer  "second_exam"
    t.integer  "permanent"
    t.integer  "unique_exam"
    t.integer  "defer_exam"
    t.float    "average"
    t.integer  "student_id"
    t.integer  "course_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["course_id"], name: "index_detail_courses_on_course_id"
    t.index ["student_id"], name: "index_detail_courses_on_student_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.string   "voucher"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "executives", force: :cascade do |t|
    t.string   "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "lastname"
    t.string   "name"
    t.string   "dni",        limit: 8
    t.string   "phone",      limit: 9
    t.string   "email"
    t.string   "gender"
    t.string   "state"
    t.string   "rol"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "turn"
    t.integer  "people_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["people_id"], name: "index_students_on_people_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "rank"
    t.integer  "people_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["people_id"], name: "index_teachers_on_people_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
