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

ActiveRecord::Schema.define(version: 2020_10_29_133636) do

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

  create_table "account_reports", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "assignment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.float "accuracy"
    t.float "altitude"
    t.index ["assignment_id"], name: "index_account_reports_on_assignment_id"
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

  create_table "accout_reports", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "account_id"
    t.uuid "assignment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_accout_reports_on_account_id"
    t.index ["assignment_id"], name: "index_accout_reports_on_assignment_id"
  end

  create_table "anomallies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "zone_report_id"
    t.uuid "dma_report_id"
    t.uuid "meter_stand_problem_id"
    t.uuid "illegaluse_id"
    t.boolean "labelled"
    t.string "other_problem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "account_report_id"
    t.string "other_illegal_use"
    t.index ["dma_report_id", "zone_report_id", "account_report_id"], name: "anomallies_uniq_index", unique: true
    t.index ["dma_report_id"], name: "index_anomallies_on_dma_report_id"
    t.index ["illegaluse_id"], name: "index_anomallies_on_illegaluse_id"
    t.index ["meter_stand_problem_id"], name: "index_anomallies_on_meter_stand_problem_id"
    t.index ["zone_report_id"], name: "index_anomallies_on_zone_report_id"
  end

  create_table "anomally_pictures", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "anomally_id"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anomally_id"], name: "index_anomally_pictures_on_anomally_id"
  end

  create_table "assignments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "task_id", null: false
    t.uuid "stage_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "staff_id", null: false
    t.uuid "user_id", default: "06471470-813f-40d6-8896-5acccd13f841", null: false
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

  create_table "building_infos", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "single_rooms"
    t.integer "bedsitters"
    t.integer "one_bedrooms"
    t.integer "two_bedrooms"
    t.integer "three_bedrooms"
    t.uuid "floor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "connection_info_id"
    t.index ["connection_info_id"], name: "index_building_infos_on_connection_info_id"
    t.index ["floor_id"], name: "index_building_infos_on_floor_id"
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

  create_table "bulk_meters", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "burst_and_lealages", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "zone_report_id"
    t.uuid "dma_report_id"
    t.uuid "pipematerial_id"
    t.uuid "pipesize_id"
    t.string "surrounding_area"
    t.string "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dma_report_id", "zone_report_id"], name: "burst_and_lealage_uniq_index", unique: true
    t.index ["dma_report_id"], name: "index_burst_and_lealages_on_dma_report_id"
    t.index ["pipematerial_id"], name: "index_burst_and_lealages_on_pipematerial_id"
    t.index ["pipesize_id"], name: "index_burst_and_lealages_on_pipesize_id"
    t.index ["zone_report_id"], name: "index_burst_and_lealages_on_zone_report_id"
  end

  create_table "burst_pictures", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "burst_and_lealage_id"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["burst_and_lealage_id"], name: "index_burst_pictures_on_burst_and_lealage_id"
  end

  create_table "connection_infos", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "zone_report_id"
    t.uuid "dma_report_id"
    t.uuid "building_type_cartegory_id"
    t.boolean "labelled"
    t.string "connection_number"
    t.uuid "account_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "account_report_id"
    t.string "name"
    t.index ["account_status_id"], name: "index_connection_infos_on_account_status_id"
    t.index ["building_type_cartegory_id"], name: "index_connection_infos_on_building_type_cartegory_id"
    t.index ["dma_report_id", "zone_report_id", "account_report_id"], name: "connection_infos_uniq_index", unique: true
    t.index ["dma_report_id"], name: "index_connection_infos_on_dma_report_id"
    t.index ["zone_report_id"], name: "index_connection_infos_on_zone_report_id"
  end

  create_table "departments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dma_assignments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "dma_id"
    t.uuid "task_id"
    t.uuid "user_id"
    t.uuid "staff_id"
    t.uuid "stage_id"
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dma_id"], name: "index_dma_assignments_on_dma_id"
    t.index ["staff_id"], name: "index_dma_assignments_on_staff_id"
    t.index ["stage_id"], name: "index_dma_assignments_on_stage_id"
    t.index ["task_id"], name: "index_dma_assignments_on_task_id"
    t.index ["user_id"], name: "index_dma_assignments_on_user_id"
  end

  create_table "dma_reports", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "scheme_id"
    t.uuid "bulk_meter_id"
    t.uuid "dma_assignment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.float "accuracy"
    t.float "altitude"
    t.string "section"
    t.index ["bulk_meter_id"], name: "index_dma_reports_on_bulk_meter_id"
    t.index ["dma_assignment_id"], name: "index_dma_reports_on_dma_assignment_id"
    t.index ["scheme_id"], name: "index_dma_reports_on_scheme_id"
  end

  create_table "dmapictures", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "dma_report_id"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dma_report_id"], name: "index_dmapictures_on_dma_report_id"
  end

  create_table "dmas", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dmas_zones", id: false, force: :cascade do |t|
    t.uuid "zone_id"
    t.uuid "dma_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "floors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "form_question_data", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.jsonb "data", default: "{}", null: false
    t.uuid "form_question_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "assignment_id", null: false
    t.index ["assignment_id"], name: "index_form_question_data_on_assignment_id"
    t.index ["data"], name: "index_form_question_data_on_data", using: :gin
    t.index ["form_question_id"], name: "index_form_question_data_on_form_question_id"
  end

  create_table "form_question_datum_files", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "file_type"
    t.uuid "form_question_datum_id"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_question_datum_id"], name: "index_form_question_datum_files_on_form_question_datum_id"
  end

  create_table "form_question_options", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.jsonb "data", default: "{}", null: false
    t.uuid "form_question_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data"], name: "index_form_question_options_on_data", using: :gin
    t.index ["form_question_id"], name: "index_form_question_options_on_form_question_id"
  end

  create_table "form_questions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "query"
    t.string "response_type"
    t.uuid "form_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "options", default: "{}", null: false
    t.index ["form_id"], name: "index_form_questions_on_form_id"
  end

  create_table "forms", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.uuid "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_forms_on_task_id"
  end

  create_table "further_actions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "illegal_use_pictures", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "anomally_id"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anomally_id"], name: "index_illegal_use_pictures_on_anomally_id"
  end

  create_table "illegaluses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "land_mark_pictures", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "burst_and_lealage_id"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["burst_and_lealage_id"], name: "index_land_mark_pictures_on_burst_and_lealage_id"
  end

  create_table "meter_info_pictures", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "meter_info_id"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meter_info_id"], name: "index_meter_info_pictures_on_meter_info_id"
  end

  create_table "meter_infos", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "zone_report_id"
    t.uuid "dma_report_id"
    t.uuid "meter_status_id"
    t.string "meter_serial"
    t.string "meter_reading"
    t.boolean "meter_accessible"
    t.string "meter_present"
    t.string "meter_stand_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "account_report_id"
    t.index ["dma_report_id", "zone_report_id", "account_report_id"], name: "meter_infos_uniq_index", unique: true
    t.index ["dma_report_id"], name: "index_meter_infos_on_dma_report_id"
    t.index ["meter_status_id"], name: "index_meter_infos_on_meter_status_id"
    t.index ["zone_report_id"], name: "index_meter_infos_on_zone_report_id"
  end

  create_table "meter_readings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "previous"
    t.string "current"
    t.uuid "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_meter_readings_on_account_id"
  end

  create_table "meter_stand_problems", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meter_statuses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "org_data", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.jsonb "data", default: "{}", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data"], name: "index_org_data_on_data", using: :gin
  end

  create_table "organizations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "subdomain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "other_illegal_uses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "illegaluse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["illegaluse_id"], name: "index_other_illegal_uses_on_illegaluse_id"
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

  create_table "pipematerials", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pipesizes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions_subdepartments", id: false, force: :cascade do |t|
    t.uuid "position_id"
    t.uuid "subdepartment_id"
    t.index ["position_id"], name: "index_positions_subdepartments_on_position_id"
    t.index ["subdepartment_id"], name: "index_positions_subdepartments_on_subdepartment_id"
  end

  create_table "positions_tasks", id: false, force: :cascade do |t|
    t.uuid "task_id"
    t.uuid "position_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "remarks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "report_further_action_pictures", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "report_further_action_id"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_further_action_id"], name: "report_faction_pictures"
  end

  create_table "report_further_actions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "zone_report_id"
    t.uuid "dma_report_id"
    t.uuid "account_report_id"
    t.boolean "relocate_meter"
    t.boolean "raise_meter"
    t.boolean "replace_meter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remark"
    t.boolean "action_taken"
    t.string "other"
    t.string "disconnection_type"
    t.string "repairs_done"
    t.index ["account_report_id"], name: "index_report_further_actions_on_account_report_id"
    t.index ["dma_report_id"], name: "index_report_further_actions_on_dma_report_id"
    t.index ["zone_report_id"], name: "index_report_further_actions_on_zone_report_id"
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

  create_table "zone_assignments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "zone_id"
    t.uuid "task_id"
    t.uuid "user_id"
    t.uuid "staff_id"
    t.uuid "stage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "desc"
    t.index ["staff_id"], name: "index_zone_assignments_on_staff_id"
    t.index ["stage_id"], name: "index_zone_assignments_on_stage_id"
    t.index ["task_id"], name: "index_zone_assignments_on_task_id"
    t.index ["user_id"], name: "index_zone_assignments_on_user_id"
    t.index ["zone_id"], name: "index_zone_assignments_on_zone_id"
  end

  create_table "zone_reports", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "scheme_id"
    t.uuid "bulk_meter_id"
    t.uuid "zone_assignment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.float "accuracy"
    t.float "altitude"
    t.index ["bulk_meter_id"], name: "index_zone_reports_on_bulk_meter_id"
    t.index ["scheme_id"], name: "index_zone_reports_on_scheme_id"
    t.index ["zone_assignment_id"], name: "index_zone_reports_on_zone_assignment_id"
  end

  create_table "zonepictures", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "zone_report_id"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zone_report_id"], name: "index_zonepictures_on_zone_report_id"
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
  add_foreign_key "account_reports", "assignments"
  add_foreign_key "accounts", "walkroutes"
  add_foreign_key "accout_reports", "accounts"
  add_foreign_key "accout_reports", "assignments"
  add_foreign_key "anomallies", "dma_reports"
  add_foreign_key "anomallies", "illegaluses"
  add_foreign_key "anomallies", "meter_stand_problems"
  add_foreign_key "anomallies", "zone_reports"
  add_foreign_key "anomally_pictures", "anomallies"
  add_foreign_key "assignments", "stages"
  add_foreign_key "assignments", "tasks"
  add_foreign_key "building_details", "building_type_cartegories"
  add_foreign_key "building_infos", "connection_infos"
  add_foreign_key "building_infos", "floors"
  add_foreign_key "building_type_cartegories", "building_types"
  add_foreign_key "burst_and_lealages", "dma_reports"
  add_foreign_key "burst_and_lealages", "pipematerials"
  add_foreign_key "burst_and_lealages", "pipesizes"
  add_foreign_key "burst_and_lealages", "zone_reports"
  add_foreign_key "burst_pictures", "burst_and_lealages"
  add_foreign_key "connection_infos", "account_statuses"
  add_foreign_key "connection_infos", "building_type_cartegories"
  add_foreign_key "connection_infos", "dma_reports"
  add_foreign_key "connection_infos", "zone_reports"
  add_foreign_key "dma_assignments", "dmas"
  add_foreign_key "dma_assignments", "staffs"
  add_foreign_key "dma_assignments", "stages"
  add_foreign_key "dma_assignments", "tasks"
  add_foreign_key "dma_assignments", "users"
  add_foreign_key "dma_reports", "bulk_meters"
  add_foreign_key "dma_reports", "dma_assignments"
  add_foreign_key "dma_reports", "schemes"
  add_foreign_key "dmapictures", "dma_reports"
  add_foreign_key "form_question_data", "form_questions"
  add_foreign_key "form_question_datum_files", "form_question_data"
  add_foreign_key "form_question_options", "form_questions"
  add_foreign_key "form_questions", "forms"
  add_foreign_key "forms", "tasks"
  add_foreign_key "illegal_use_pictures", "anomallies"
  add_foreign_key "land_mark_pictures", "burst_and_lealages"
  add_foreign_key "meter_info_pictures", "meter_infos"
  add_foreign_key "meter_infos", "dma_reports"
  add_foreign_key "meter_infos", "meter_statuses"
  add_foreign_key "meter_infos", "zone_reports"
  add_foreign_key "meter_readings", "accounts"
  add_foreign_key "other_illegal_uses", "illegaluses"
  add_foreign_key "other_remarks", "remarks"
  add_foreign_key "others", "further_actions"
  add_foreign_key "pictures", "reports"
  add_foreign_key "report_further_actions", "account_reports"
  add_foreign_key "report_further_actions", "dma_reports"
  add_foreign_key "report_further_actions", "zone_reports"
  add_foreign_key "reports", "assignments"
  add_foreign_key "reports", "further_actions"
  add_foreign_key "sch_zone_details", "schemes"
  add_foreign_key "sch_zone_details", "zones"
  add_foreign_key "subdepartments", "departments"
  add_foreign_key "subzones", "zones"
  add_foreign_key "walkroutes", "subzones"
  add_foreign_key "zone_assignments", "staffs"
  add_foreign_key "zone_assignments", "stages"
  add_foreign_key "zone_assignments", "tasks"
  add_foreign_key "zone_assignments", "users"
  add_foreign_key "zone_assignments", "zones"
  add_foreign_key "zone_reports", "bulk_meters"
  add_foreign_key "zone_reports", "schemes"
  add_foreign_key "zone_reports", "zone_assignments"
  add_foreign_key "zonepictures", "zone_reports"
end
