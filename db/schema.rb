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

ActiveRecord::Schema.define(version: 2019_12_22_102508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "account_details", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "current_reading"
    t.string "previous_reading"
    t.uuid "account_id"
    t.uuid "account_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "meter_serial"
    t.uuid "building_type_cartegory_id"
    t.index ["account_id"], name: "index_account_details_on_account_id"
    t.index ["account_status_id"], name: "index_account_details_on_account_status_id"
    t.index ["building_type_cartegory_id"], name: "index_account_details_on_building_type_cartegory_id"
  end

  create_table "account_statuses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "number"
    t.string "meter_serial"
    t.string "name"
    t.uuid "walkroute_id"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "old_account_number"
    t.string "sewer"
    t.string "water"
    t.string "connection_status"
    t.string "tariff"
    t.string "building_type"
    t.string "house_type"
    t.string "house_units"
    t.index ["walkroute_id"], name: "index_accounts_on_walkroute_id"
  end

  create_table "assignments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "task_id", null: false
    t.uuid "stage_id", null: false
    t.uuid "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "staff_id", null: false
    t.uuid "user_id", default: "06471470-813f-40d6-8896-5acccd13f841", null: false
    t.index ["account_id"], name: "index_assignments_on_account_id"
    t.index ["stage_id"], name: "index_assignments_on_stage_id"
    t.index ["task_id"], name: "index_assignments_on_task_id"
  end

  create_table "building_details", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.uuid "building_type_cartegory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_type_cartegory_id"], name: "index_building_details_on_building_type_cartegory_id"
  end

  create_table "building_type_cartegories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.uuid "building_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_type_id"], name: "index_building_type_cartegories_on_building_type_id"
  end

  create_table "building_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "further_actions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meter_readings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "previous"
    t.string "current"
    t.uuid "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_meter_readings_on_account_id"
  end

  create_table "other_remarks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "remark_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["remark_id"], name: "index_other_remarks_on_remark_id"
  end

  create_table "others", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "further_action_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["further_action_id"], name: "index_others_on_further_action_id"
  end

  create_table "pictures", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.index ["report_id"], name: "index_pictures_on_report_id"
  end

  create_table "positions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.uuid "subdepartment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subdepartment_id"], name: "index_positions_on_subdepartment_id"
  end

  create_table "positions_subdepartments", id: false, force: :cascade do |t|
    t.uuid "position_id"
    t.uuid "subdepartment_id"
    t.index ["position_id"], name: "index_positions_subdepartments_on_position_id"
    t.index ["subdepartment_id"], name: "index_positions_subdepartments_on_subdepartment_id"
  end

  create_table "remarks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.boolean "completed"
    t.string "comments"
    t.uuid "further_action_id"
    t.uuid "assignment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.uuid "remark_id", default: "e6f350a6-1bb1-4e7b-921b-8dfcc5a534d2", null: false
    t.string "meter_reading"
    t.string "meter_serial"
    t.index ["assignment_id"], name: "index_reports_on_assignment_id", unique: true
    t.index ["further_action_id"], name: "index_reports_on_further_action_id"
    t.index ["remark_id"], name: "index_reports_on_remark_id"
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sch_zone_details", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "scheme_id"
    t.uuid "zone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scheme_id"], name: "index_sch_zone_details_on_scheme_id"
    t.index ["zone_id"], name: "index_sch_zone_details_on_zone_id"
  end

  create_table "schemes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.uuid "position_id"
    t.json "tokens"
    t.text "authentication_token"
    t.datetime "authentication_token_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authentication_token"], name: "index_staffs_on_authentication_token", unique: true
    t.index ["confirmation_token"], name: "index_staffs_on_confirmation_token", unique: true
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["phone_number"], name: "index_staffs_on_phone_number", unique: true
    t.index ["position_id"], name: "index_staffs_on_position_id"
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_staffs_on_uid_and_provider", unique: true
  end

  create_table "stages", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subdepartments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.uuid "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_subdepartments_on_department_id"
  end

  create_table "subdepartments_tasks", id: false, force: :cascade do |t|
    t.uuid "task_id"
    t.uuid "subdepartment_id"
    t.index ["subdepartment_id", "task_id"], name: "index_subdepartments_tasks_on_subdepartment_id_and_task_id", unique: true
    t.index ["subdepartment_id"], name: "index_subdepartments_tasks_on_subdepartment_id"
    t.index ["task_id"], name: "index_subdepartments_tasks_on_task_id"
  end

  create_table "subzones", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.uuid "zone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zone_id"], name: "index_subzones_on_zone_id"
  end

  create_table "tasks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "role_id"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "authentication_token"
    t.datetime "authentication_token_created_at"
    t.uuid "subdepartment_id", default: "46dd7aed-4aba-40ff-8bde-38674a287765", null: false
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "walkroutes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.uuid "subzone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subzone_id"], name: "index_walkroutes_on_subzone_id"
  end

  create_table "zones", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "account_details", "account_statuses"
  add_foreign_key "account_details", "accounts"
  add_foreign_key "account_details", "building_type_cartegories"
  add_foreign_key "accounts", "walkroutes"
  add_foreign_key "assignments", "accounts"
  add_foreign_key "assignments", "stages"
  add_foreign_key "assignments", "tasks"
  add_foreign_key "building_details", "building_type_cartegories"
  add_foreign_key "building_type_cartegories", "building_types"
  add_foreign_key "meter_readings", "accounts"
  add_foreign_key "other_remarks", "remarks"
  add_foreign_key "others", "further_actions"
  add_foreign_key "pictures", "reports"
  add_foreign_key "positions", "subdepartments"
  add_foreign_key "reports", "assignments"
  add_foreign_key "reports", "further_actions"
  add_foreign_key "sch_zone_details", "schemes"
  add_foreign_key "sch_zone_details", "zones"
  add_foreign_key "subdepartments", "departments"
  add_foreign_key "subzones", "zones"
  add_foreign_key "walkroutes", "subzones"
end
