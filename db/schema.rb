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

ActiveRecord::Schema.define(version: 20180123095513) do

  create_table "accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "careers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.text "description"
    t.string "places_for_work"
    t.string "categorizable_type"
    t.bigint "categorizable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categorizable_type", "categorizable_id"], name: "index_careers_on_categorizable_type_and_categorizable_id"
  end

  create_table "careers_games", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "career_id"
    t.bigint "game_id"
    t.boolean "is_goal", default: false
    t.index ["career_id"], name: "index_careers_games_on_career_id"
    t.index ["game_id"], name: "index_careers_games_on_game_id"
  end

  create_table "careers_schools", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "career_id"
    t.bigint "school_id"
    t.index ["career_id"], name: "index_careers_schools_on_career_id"
    t.index ["school_id"], name: "index_careers_schools_on_school_id"
  end

  create_table "characteristics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characteristics_entries", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "characteristic_id"
    t.bigint "entry_id"
    t.index ["characteristic_id"], name: "index_characteristics_entries_on_characteristic_id"
    t.index ["entry_id"], name: "index_characteristics_entries_on_entry_id"
  end

  create_table "departments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.integer "school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
  end

  create_table "entries_games", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "entry_id"
    t.bigint "game_id"
    t.index ["entry_id"], name: "index_entries_games_on_entry_id"
    t.index ["game_id"], name: "index_entries_games_on_game_id"
  end

  create_table "games", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id", null: false
    t.integer "characteristic_id"
    t.string "reason"
    t.string "audio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "majors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.integer "department_id"
    t.integer "school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personal_understandings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.string "are_you_going_to_study_till_grade12"
    t.string "are_your_parents_allow_you_to_study_till_grade12"
    t.string "have_you_ever_thought_of_career"
    t.string "career_name"
    t.string "how_to_reach_career_goal"
    t.string "does_parents_agree_with"
    t.string "ever_talked_with_anyone_about_career"
    t.string "how_to_reach_job_vacancy"
    t.string "who_to_reach_job_vacancy"
    t.string "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.string "logo"
    t.string "address"
    t.string "province"
    t.string "phone_numbers"
    t.string "faxes"
    t.string "emails"
    t.string "website_or_facebook"
    t.string "mailbox"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subject_tips", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "subject_code", null: false
    t.string "tip", null: false
    t.string "tip_type", null: false
  end

  create_table "subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "game_id", null: false
    t.string "khmer_reading"
    t.string "khmer_writing"
    t.string "english"
    t.string "math"
    t.string "social_study_ethics_and_citizenship"
    t.string "social_study_geography"
    t.string "social_study_history"
    t.string "science_physics"
    t.string "science_chemistry"
    t.string "science_biology"
    t.string "soft_skill_communication"
    t.string "soft_skill_brave"
    t.string "soft_skill_teamwork"
    t.string "soft_skill_problemsolving"
    t.string "soft_skill_publicspeaking"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "uuid"
    t.string "full_name", null: false
    t.string "password", null: false
    t.string "username", null: false
    t.string "sex", null: false
    t.date "date_of_birth", null: false
    t.string "phone_number", null: false
    t.string "nationality", null: false
    t.string "school_name", null: false
    t.string "grade", null: false
    t.string "address", null: false
    t.string "father_name"
    t.string "father_occupation"
    t.string "mother_name"
    t.string "mother_occupation"
    t.string "guidance"
    t.string "parent_contact_number"
    t.integer "number_of_family_member"
    t.integer "number_of_sisters"
    t.integer "number_of_brothers"
    t.boolean "is_divorce"
    t.boolean "is_disable"
    t.boolean "is_domestic_violence"
    t.boolean "is_smoking"
    t.boolean "is_alcoholic"
    t.boolean "is_drug"
    t.string "house_type"
    t.string "collective_income"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
  end

  create_table "vocationals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
