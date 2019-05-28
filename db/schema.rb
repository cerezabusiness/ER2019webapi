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

ActiveRecord::Schema.define(version: 2019_05_27_224704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.time "start_time"
    t.time "end_time"
    t.bigint "event_date_id"
    t.bigint "places_event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_date_id"], name: "index_activities_on_event_date_id"
    t.index ["places_event_id"], name: "index_activities_on_places_event_id"
  end

  create_table "activities_people", force: :cascade do |t|
    t.bigint "activity_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_activities_people_on_activity_id"
    t.index ["person_id"], name: "index_activities_people_on_person_id"
  end

  create_table "checkins", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "event_date_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_date_id"], name: "index_checkins_on_event_date_id"
    t.index ["person_id"], name: "index_checkins_on_person_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_dates", force: :cascade do |t|
    t.date "date"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_dates_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.text "question"
    t.text "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "friend1"
    t.integer "friend2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "information", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_information_on_event_id"
  end

  create_table "multimedia", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.bigint "multimedia_type_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_multimedia_on_event_id"
    t.index ["multimedia_type_id"], name: "index_multimedia_on_multimedia_type_id"
  end

  create_table "multimedia_types", force: :cascade do |t|
    t.string "multimedia_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "picture"
    t.text "description"
    t.string "phone"
    t.string "email"
    t.string "city_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["company_id"], name: "index_people_on_company_id"
  end

  create_table "persons_events", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "event_id"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_persons_events_on_event_id"
    t.index ["person_id"], name: "index_persons_events_on_person_id"
    t.index ["profile_id"], name: "index_persons_events_on_profile_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places_events", force: :cascade do |t|
    t.bigint "place_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_places_events_on_event_id"
    t.index ["place_id"], name: "index_places_events_on_place_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "profile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "activities", "event_dates"
  add_foreign_key "activities", "places_events"
  add_foreign_key "activities_people", "activities"
  add_foreign_key "activities_people", "people"
  add_foreign_key "checkins", "event_dates"
  add_foreign_key "checkins", "people"
  add_foreign_key "event_dates", "events"
  add_foreign_key "friendships", "people", column: "friend1", on_delete: :cascade
  add_foreign_key "friendships", "people", column: "friend2", on_delete: :cascade
  add_foreign_key "information", "events"
  add_foreign_key "multimedia", "events"
  add_foreign_key "multimedia", "multimedia_types"
  add_foreign_key "people", "companies"
  add_foreign_key "persons_events", "events"
  add_foreign_key "persons_events", "people"
  add_foreign_key "persons_events", "profiles"
  add_foreign_key "places_events", "events"
  add_foreign_key "places_events", "places"
end
