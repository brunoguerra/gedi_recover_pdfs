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

ActiveRecord::Schema.define(:version => 20130925104917) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "gedi_analyses", :force => true do |t|
    t.integer  "infraction_id"
    t.string   "plate",          :limit => 10
    t.integer  "discard_id"
    t.integer  "analyst_id"
    t.integer  "number"
    t.boolean  "inspection",                   :default => false
    t.integer  "exportation_id"
    t.boolean  "finished"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.boolean  "is_valid"
  end

  add_index "gedi_analyses", ["analyst_id"], :name => "index_gedi_analyses_on_analyst_id"
  add_index "gedi_analyses", ["finished", "discard_id"], :name => "index_gedi_analyses_on_finished_and_discard_id"
  add_index "gedi_analyses", ["finished"], :name => "index_gedi_analyses_on_finished"

  create_table "gedi_analysis_conflicts", :force => true do |t|
    t.integer  "infraction_id"
    t.datetime "date_resolved"
    t.string   "plate",                :limit => 10
    t.boolean  "resolved"
    t.integer  "analysis_accepted_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "gedi_analysis_conflicts", ["infraction_id"], :name => "index_gedi_supervision_infractions_on_infraction_id"

  create_table "gedi_analysis_plate_queries", :force => true do |t|
    t.integer  "integration_id"
    t.string   "plate"
    t.integer  "infraction_id"
    t.boolean  "extra"
    t.integer  "status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "gedi_analysis_plate_queries", ["infraction_id"], :name => "index_gedi_analysis_plate_queries_on_infraction_id"
  add_index "gedi_analysis_plate_queries", ["integration_id"], :name => "index_gedi_analysis_plate_queries_on_integration_id"

  create_table "gedi_analysis_properties", :force => true do |t|
    t.integer  "property_type_id"
    t.string   "value"
    t.integer  "analysis_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "gedi_analysis_properties", ["analysis_id"], :name => "index_gedi_analysis_analyses_properties_on_analysis_id"
  add_index "gedi_analysis_properties", ["property_type_id"], :name => "index_gedi_analysis_analyses_properties_on_property_type_id"

  create_table "gedi_analysts", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.boolean  "enabled"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "gedi_analysts", ["user_id"], :name => "index_gedi_analysts_on_user_id"

  create_table "gedi_check_infractions", :force => true do |t|
    t.integer  "infraction_id"
    t.integer  "user_id"
    t.boolean  "checked"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "gedi_check_infractions", ["infraction_id"], :name => "index_gedi_check_infractions_on_infraction_id"
  add_index "gedi_check_infractions", ["user_id"], :name => "index_gedi_check_infractions_on_user_id"

  create_table "gedi_contracts", :force => true do |t|
    t.datetime "date_start"
    t.datetime "date_finish"
    t.integer  "department_transport_id"
    t.integer  "city_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "gedi_department_transports", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "zip_code"
    t.text     "description_text"
    t.integer  "city_id"
    t.integer  "state_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "gedi_discards", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.boolean  "enabled",    :default => true
    t.integer  "score",      :default => 0
  end

  create_table "gedi_equipment", :force => true do |t|
    t.string   "code"
    t.string   "description"
    t.boolean  "enabled",     :default => true
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "gedi_equipment", ["code"], :name => "index_gedi_equipment_on_code", :unique => true

  create_table "gedi_equipment_local_lanes", :force => true do |t|
    t.integer  "equipment_local_id"
    t.integer  "lane"
    t.string   "certification"
    t.date     "certification_expiration"
    t.string   "verification"
    t.string   "verification_expiration"
    t.boolean  "enabled",                  :default => true
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "orientation"
  end

  add_index "gedi_equipment_local_lanes", ["equipment_local_id"], :name => "index_gedi_equipment_local_lanes_on_equipment_local_id"

  create_table "gedi_equipment_locals", :force => true do |t|
    t.integer  "equipment_id"
    t.string   "description"
    t.integer  "city_id"
    t.string   "code"
    t.string   "certification"
    t.boolean  "enabled",                                      :default => true
    t.datetime "created_at",                                                     :null => false
    t.datetime "updated_at",                                                     :null => false
    t.string   "address"
    t.decimal  "latitude",      :precision => 15, :scale => 6,                   :null => false
    t.decimal  "longitude",     :precision => 15, :scale => 6,                   :null => false
    t.integer  "state_id"
    t.boolean  "gmaps",                                        :default => true
    t.integer  "lanes"
  end

  add_index "gedi_equipment_locals", ["city_id"], :name => "index_gedi_equipment_locals_on_city_id"
  add_index "gedi_equipment_locals", ["equipment_id"], :name => "index_gedi_equipment_locals_on_equipment_id"

  create_table "gedi_equipment_status", :force => true do |t|
    t.integer  "type_id"
    t.integer  "value"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "equipment_id"
  end

  add_index "gedi_equipment_status", ["type_id"], :name => "index_gedi_equipment_statuses_on_type_id"

  create_table "gedi_equipment_status_types", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "gedi_equipment_status_types", ["category_id"], :name => "index_gedi_equipment_status_types_on_category_id"

  create_table "gedi_events", :force => true do |t|
    t.integer  "lot_id"
    t.integer  "speed"
    t.string   "plate"
    t.datetime "datetime"
    t.integer  "lane"
    t.integer  "size"
    t.integer  "equipment_id"
    t.integer  "lot_sequence"
    t.integer  "line"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "gedi_events", ["datetime"], :name => "index_gedi_events_on_datetime"
  add_index "gedi_events", ["equipment_id"], :name => "index_gedi_events_on_equipment_id"
  add_index "gedi_events", ["lot_id"], :name => "index_gedi_events_on_lot_id"

  create_table "gedi_image_data", :force => true do |t|
    t.binary   "data"
    t.integer  "image_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "gedi_image_data", ["image_id"], :name => "index_gedi_image_data_on_image_id"

  create_table "gedi_image_properties", :force => true do |t|
    t.integer  "type_id"
    t.string   "value"
    t.integer  "image_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "gedi_image_properties", ["image_id"], :name => "index_gedi_image_properties_on_image_id"
  add_index "gedi_image_properties", ["type_id"], :name => "index_gedi_image_properties_on_type_id"

  create_table "gedi_images", :force => true do |t|
    t.text     "file_name"
    t.datetime "date"
    t.integer  "type_image_id"
    t.integer  "infraction_id"
    t.integer  "lot_pic_number"
    t.integer  "lot_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "gedi_images", ["infraction_id"], :name => "index_gedi_images_on_infraction_id"
  add_index "gedi_images", ["lot_id"], :name => "index_gedi_images_on_lot_id"

  create_table "gedi_infraction_aggravatings", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gedi_infraction_processes", :force => true do |t|
    t.integer  "infraction_id"
    t.integer  "process_step_id"
    t.integer  "user_id"
    t.integer  "status",          :default => 0
    t.integer  "integration_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "gedi_infraction_processes", ["infraction_id"], :name => "index_gedi_infraction_processes_on_infraction_id"
  add_index "gedi_infraction_processes", ["integration_id"], :name => "index_gedi_infraction_processes_on_integration_id"

  create_table "gedi_infraction_properties", :force => true do |t|
    t.integer  "infraction_id"
    t.integer  "infraction_proprietary_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "gedi_infraction_properties", ["infraction_id"], :name => "index_gedi_infraction_properties_on_infraction_id"
  add_index "gedi_infraction_properties", ["infraction_proprietary_id"], :name => "index_gedi_infraction_properties_on_infraction_proprietary_id"

  create_table "gedi_infraction_types", :force => true do |t|
    t.string   "name",        :limit => 150
    t.string   "code",        :limit => 50
    t.text     "description"
    t.boolean  "enabled",                    :default => true
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  create_table "gedi_infraction_violators", :force => true do |t|
    t.integer "violator_id"
    t.integer "vehicle_id"
    t.integer "infraction_id"
  end

  create_table "gedi_infractions", :force => true do |t|
    t.datetime "datetime_start"
    t.integer  "infraction_aggravating_id"
    t.integer  "infraction_type_id",                                    :null => false
    t.integer  "event_id",                                              :null => false
    t.integer  "discard_id"
    t.integer  "lane"
    t.integer  "equipment_id",                                          :null => false
    t.integer  "lot_pic_sequence"
    t.integer  "status",                                 :default => 0, :null => false
    t.integer  "lot_id"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.string   "plate",                     :limit => 7
  end

  add_index "gedi_infractions", ["datetime_start", "lane", "equipment_id", "lot_pic_sequence", "infraction_type_id"], :name => "index_gedi_events_garant_unique", :unique => true
  add_index "gedi_infractions", ["event_id"], :name => "index_gedi_infractions_on_event_id"
  add_index "gedi_infractions", ["status"], :name => "index_gedi_infractions_on_status"

  create_table "gedi_integrations", :force => true do |t|
    t.integer  "direction"
    t.string   "src"
    t.integer  "user_id"
    t.integer  "type_id"
    t.integer  "status",      :default => 1
    t.integer  "response_to"
    t.boolean  "success",     :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "gedi_lots", :force => true do |t|
    t.string   "name"
    t.string   "file"
    t.integer  "equipment_local_id"
    t.integer  "status_id"
    t.date     "date"
    t.date     "date_last"
    t.date     "date_imported"
    t.integer  "event_sequence_start"
    t.integer  "event_sequence_end"
    t.integer  "total_events"
    t.integer  "total_infractions"
    t.integer  "total_ignored"
    t.integer  "default"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "gedi_lots", ["equipment_local_id"], :name => "index_gedi_lots_on_equipment_local_id"

  create_table "gedi_managed_task_executions", :force => true do |t|
    t.integer  "managed_task_id"
    t.datetime "datetime_finish"
    t.text     "activity"
    t.integer  "status"
    t.integer  "integration_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "gedi_managed_task_executions", ["integration_id"], :name => "index_gedi_managed_task_executions_on_integration_id"
  add_index "gedi_managed_task_executions", ["managed_task_id"], :name => "index_gedi_managed_task_executions_on_managed_task_id"

  create_table "gedi_managed_tasks", :force => true do |t|
    t.string   "name"
    t.string   "task"
    t.integer  "interval"
    t.integer  "failover"
    t.string   "class_info"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gedi_migration_equipments", :force => true do |t|
    t.string   "code"
    t.string   "local"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gedi_migration_infractions", :force => true do |t|
    t.date     "date"
    t.time     "hour"
    t.integer  "violator_id"
    t.string   "code"
    t.string   "variant"
    t.float    "speed_legal"
    t.float    "speed_computed"
    t.integer  "equipment_id"
    t.integer  "lane"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "gedi_migration_infractions", ["equipment_id"], :name => "index_gedi_migration_infractions_on_equipment_id"
  add_index "gedi_migration_infractions", ["violator_id"], :name => "index_gedi_migration_infractions_on_violator_id"

  create_table "gedi_migration_nas", :force => true do |t|
    t.string   "number"
    t.string   "emission"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gedi_migration_vehicles", :force => true do |t|
    t.string   "plate"
    t.string   "mark_model"
    t.integer  "violator_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "gedi_migration_vehicles", ["violator_id"], :name => "index_gedi_migration_vehicles_on_violator_id"

  create_table "gedi_migration_violator_addresses", :force => true do |t|
    t.integer  "violator_id"
    t.string   "desc"
    t.string   "number"
    t.string   "district"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "gedi_migration_violator_addresses", ["violator_id"], :name => "index_gedi_migration_violator_addresses_on_violator_id"

  create_table "gedi_migration_violators", :force => true do |t|
    t.string   "name"
    t.string   "doc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gedi_plate_query_integrations", :force => true do |t|
    t.integer  "integration_id"
    t.string   "plate"
    t.integer  "infraction_id"
    t.boolean  "extra"
    t.integer  "status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "confirmed"
    t.integer  "vehicle_id"
  end

  add_index "gedi_plate_query_integrations", ["infraction_id"], :name => "index_gedi_plate_query_integrations_on_infraction_id"
  add_index "gedi_plate_query_integrations", ["integration_id"], :name => "index_gedi_plate_query_integrations_on_integration_id"
  add_index "gedi_plate_query_integrations", ["status"], :name => "index_gedi_plate_query_integrations_on_status"

  create_table "gedi_property_types", :force => true do |t|
    t.string   "name"
    t.integer  "code"
    t.integer  "category_id"
    t.string   "default"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "gedi_property_types", ["category_id"], :name => "index_gedi_property_types_on_category_id"

  create_table "gedi_type_images", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gedi_vehicle_attrs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gedi_vehicle_categories", :force => true do |t|
    t.string   "name"
    t.boolean  "enabled",    :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "code"
  end

  create_table "gedi_vehicle_colors", :force => true do |t|
    t.string   "name"
    t.boolean  "enabled",    :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "code"
  end

  create_table "gedi_vehicle_fuels", :force => true do |t|
    t.string   "name"
    t.boolean  "enabled",    :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "code"
  end

  create_table "gedi_vehicle_incompletes", :force => true do |t|
    t.integer  "vehicle_id"
    t.integer  "attr_id"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gedi_vehicle_mark_models", :force => true do |t|
    t.string   "name"
    t.boolean  "enabled",    :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "code"
  end

  create_table "gedi_vehicle_species", :force => true do |t|
    t.string   "name"
    t.boolean  "enabled",    :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "code"
  end

  create_table "gedi_vehicle_types", :force => true do |t|
    t.string   "name"
    t.boolean  "enabled",    :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "code"
  end

  create_table "gedi_vehicles", :force => true do |t|
    t.string   "plate"
    t.integer  "year_fabrication"
    t.integer  "year_model"
    t.string   "chassi"
    t.string   "country"
    t.integer  "type_id"
    t.integer  "species_id"
    t.integer  "mark_model_id"
    t.integer  "fuel_id"
    t.integer  "color_id"
    t.integer  "category_id"
    t.integer  "city_id"
    t.integer  "state_id"
    t.integer  "owner_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "restriction"
    t.date     "date_transfer"
    t.date     "date_license"
    t.date     "date_dut_issuance"
    t.integer  "city_last"
    t.string   "plate_last"
    t.integer  "leasing"
    t.string   "renavam"
    t.boolean  "complete",          :default => true
  end

  add_index "gedi_vehicles", ["owner_id"], :name => "index_gedi_vehicles_on_owner_id"
  add_index "gedi_vehicles", ["plate"], :name => "index_gedi_vehicles_on_plate"

  create_table "gedi_violators", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "number"
    t.string   "complement"
    t.string   "district"
    t.string   "zip_code"
    t.string   "document"
    t.string   "cpf_cnpj"
    t.integer  "vehicle_id"
    t.boolean  "owner"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "guara_addresses", :force => true do |t|
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "city_id"
    t.integer  "district_id"
    t.string   "address",          :limit => 120
    t.string   "complement",       :limit => 30
    t.string   "postal_code",      :limit => 20
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "guara_addresses", ["state_id", "city_id"], :name => "index_guara_addresses_on_state_id_and_city_id"

  create_table "guara_business_activities", :force => true do |t|
    t.string   "name",                :limit => 100
    t.boolean  "enabled",                            :default => true
    t.integer  "business_segment_id"
    t.string   "notes",               :limit => 500
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  add_index "guara_business_activities", ["business_segment_id"], :name => "index_guara_business_activities_on_business_segment_id"

  create_table "guara_business_departments", :force => true do |t|
    t.string   "name"
    t.boolean  "enabled"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "guara_business_segments", :force => true do |t|
    t.string   "name",       :limit => 100
    t.boolean  "enabled",                   :default => true
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  create_table "guara_cities", :force => true do |t|
    t.string   "name",       :limit => 60
    t.integer  "state_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.boolean  "enabled"
    t.integer  "code"
  end

  add_index "guara_cities", ["state_id"], :name => "index_guara_cities_on_state_id"

  create_table "guara_company_businesses", :force => true do |t|
    t.string   "name"
    t.boolean  "enabled"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "guara_contacts", :force => true do |t|
    t.integer  "person_id"
    t.string   "name",              :limit => 150
    t.integer  "department_id"
    t.string   "business_function"
    t.string   "phone"
    t.string   "cell"
    t.string   "birthday"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "guara_contacts", ["department_id"], :name => "index_guara_contacts_on_department_id"
  add_index "guara_contacts", ["person_id"], :name => "index_guara_contacts_on_person_id"

  create_table "guara_customer_activities", :force => true do |t|
    t.integer  "customer_pj_id"
    t.integer  "activity_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "guara_customer_financials", :force => true do |t|
    t.integer  "person_id"
    t.boolean  "billing_address_different"
    t.integer  "contact_leader_id"
    t.boolean  "payment_pending"
    t.string   "payment_pending_message",   :limit => 500
    t.integer  "address_id"
    t.string   "notes",                     :limit => 1000
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "guara_customer_has_customers", :force => true do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "guara_customer_pfs", :force => true do |t|
    t.string   "gender",             :limit => 1
    t.string   "company"
    t.string   "business_address",   :limit => 120
    t.string   "department",         :limit => 20
    t.string   "corporate_function", :limit => 20
    t.string   "cellphone",          :limit => 15
    t.string   "graduated",          :limit => 30
    t.integer  "civil_state",        :limit => 2
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "guara_customer_pj_has_customers_pjs", :force => true do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "guara_customer_pjs", :force => true do |t|
    t.string   "fax",             :limit => 35
    t.integer  "total_employes"
    t.integer  "segment_id"
    t.integer  "activity_id"
    t.float    "annual_revenues"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "guara_customer_products", :force => true do |t|
    t.integer  "costumer_id"
    t.integer  "product_id"
    t.date     "date"
    t.boolean  "used",        :default => true
    t.integer  "rate_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "guara_customer_segments", :force => true do |t|
    t.integer  "customer_pj_id"
    t.integer  "segment_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "guara_districts", :force => true do |t|
    t.string   "name",       :limit => 60
    t.integer  "city_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "guara_districts", ["city_id"], :name => "index_guara_districts_on_city_id"

  create_table "guara_emails", :force => true do |t|
    t.integer  "customer_id"
    t.string   "email",          :limit => 120
    t.boolean  "infos",                         :default => true
    t.boolean  "private",                       :default => true
    t.integer  "emailable_id"
    t.string   "emailable_type"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  create_table "guara_microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "guara_microposts", ["user_id", "created_at"], :name => "index_guara_microposts_on_user_id_and_created_at"

  create_table "guara_people", :force => true do |t|
    t.string   "name",           :limit => 120,                    :null => false
    t.string   "doc",            :limit => 14
    t.string   "doc_rg",         :limit => 22
    t.string   "name_sec",       :limit => 120
    t.string   "address",        :limit => 150
    t.integer  "district_id"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "postal",         :limit => 8
    t.text     "notes"
    t.date     "birthday"
    t.string   "phone",          :limit => 35
    t.string   "social_link",    :limit => 200
    t.string   "site",           :limit => 200
    t.boolean  "is_customer",                   :default => false
    t.integer  "parent_id"
    t.boolean  "enabled",                       :default => true
    t.integer  "customer_id"
    t.string   "customer_type"
    t.boolean  "complete"
    t.float    "annual_revenue"
    t.integer  "external_key"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.string   "other_contacts", :limit => 70
    t.string   "number"
  end

  create_table "guara_relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "guara_relationships", ["followed_id"], :name => "index_guara_relationships_on_followed_id"
  add_index "guara_relationships", ["follower_id", "followed_id"], :name => "index_guara_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "guara_relationships", ["follower_id"], :name => "index_guara_relationships_on_follower_id"

  create_table "guara_states", :force => true do |t|
    t.string   "name",       :limit => 30
    t.string   "acronym",    :limit => 2
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "guara_system_abilities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "guara_system_extensions", :force => true do |t|
    t.string   "name"
    t.boolean  "enabled"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "guara_system_modules", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "guara_system_task_resolutions", :force => true do |t|
    t.string  "name"
    t.integer "parent_id"
  end

  create_table "guara_system_task_status", :force => true do |t|
    t.string "name"
  end

  create_table "guara_task_feedbacks", :force => true do |t|
    t.integer  "task_id"
    t.datetime "date"
    t.string   "notes"
    t.integer  "user_id"
    t.integer  "status_id"
    t.integer  "resolution_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "guara_task_types", :force => true do |t|
    t.string   "name"
    t.boolean  "enabled"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "company_business_id"
  end

  add_index "guara_task_types", ["company_business_id"], :name => "index_guara_task_types_on_company_business_id"

  create_table "guara_tasks", :force => true do |t|
    t.string   "name",            :limit => 150
    t.integer  "interested_id"
    t.string   "interested_type"
    t.integer  "contact_id"
    t.string   "contact_type"
    t.datetime "due_time"
    t.datetime "finish_time"
    t.text     "notes"
    t.string   "description",     :limit => 1000
    t.integer  "user_id"
    t.integer  "status_id"
    t.integer  "type_id"
    t.integer  "assigned_id"
    t.integer  "resolution_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "guara_tasks", ["assigned_id"], :name => "index_guara_tasks_on_assigned_id"
  add_index "guara_tasks", ["interested_id", "interested_type"], :name => "index_guara_tasks_on_interested_id_and_interested_type"
  add_index "guara_tasks", ["status_id"], :name => "index_guara_tasks_on_status_id"
  add_index "guara_tasks", ["type_id"], :name => "index_guara_tasks_on_type_id"

  create_table "guara_user_abilities", :force => true do |t|
    t.integer  "module_id"
    t.integer  "ability_id"
    t.integer  "skilled_id"
    t.string   "skilled_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "guara_user_groups", :force => true do |t|
    t.string   "name"
    t.boolean  "enabled",    :default => true
    t.boolean  "system",     :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "guara_users", :force => true do |t|
    t.string   "name",                        :limit => 25
    t.string   "email",                       :limit => 100
    t.boolean  "enabled",                                    :default => true
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
    t.string   "remember_token"
    t.boolean  "admin",                                      :default => false
    t.string   "encrypted_password",                         :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                              :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "primary_group_id"
    t.integer  "type_id",                                    :default => 0,     :null => false
    t.integer  "primary_company_business_id"
  end

  add_index "guara_users", ["email"], :name => "index_guara_users_on_email", :unique => true
  add_index "guara_users", ["primary_group_id"], :name => "index_guara_users_on_primary_group_id"
  add_index "guara_users", ["remember_token"], :name => "index_guara_users_on_remember_token"
  add_index "guara_users", ["reset_password_token"], :name => "index_guara_users_on_reset_password_token", :unique => true

  create_table "guara_users_has_groups", :force => true do |t|
    t.integer  "user_id"
    t.integer  "user_group_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "guara_users_has_groups", ["user_group_id"], :name => "index_guara_users_has_groups_on_user_group_id"
  add_index "guara_users_has_groups", ["user_id", "user_group_id"], :name => "index_guara_users_has_groups_on_user_id_and_user_group_id", :unique => true
  add_index "guara_users_has_groups", ["user_id"], :name => "index_guara_users_has_groups_on_user_id"

end
