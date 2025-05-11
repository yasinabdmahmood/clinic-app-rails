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

ActiveRecord::Schema[8.0].define(version: 2024_04_24_000006) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.date "appointment_date", null: false
    t.time "start_time"
    t.time "end_time"
    t.string "status", null: false
    t.text "purpose"
    t.text "notes"
    t.bigint "created_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_appointments_on_created_by_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "categories", force: :cascade do |t|
    t.text "title", null: false
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medical_cases", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "category_id", null: false
    t.text "description"
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_medical_cases_on_category_id"
    t.index ["patient_id"], name: "index_medical_cases_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name", null: false
    t.string "gender"
    t.date "date_of_birth"
    t.text "address"
    t.string "email"
    t.string "phone"
    t.text "notes"
    t.string "emergency_contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.string "full_name", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.bigint "medical_case_id", null: false
    t.date "visit_date", null: false
    t.text "notes"
    t.text "vitals"
    t.text "treatment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medical_case_id"], name: "index_visits_on_medical_case_id"
  end

  add_foreign_key "appointments", "patients"
  add_foreign_key "appointments", "users", column: "created_by_id"
  add_foreign_key "medical_cases", "categories"
  add_foreign_key "medical_cases", "patients"
  add_foreign_key "visits", "medical_cases"
end
