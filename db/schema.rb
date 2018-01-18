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

ActiveRecord::Schema.define(version: 20180118042221) do

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

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "uuid", null: false
    t.string "full_name", null: false
    t.string "password", null: false
    t.string "username", null: false
    t.string "sex", null: false
    t.date "dateOfBirth", null: false
    t.string "phoneNumber", null: false
    t.string "nationality", null: false
    t.string "schoolName", null: false
    t.string "grade", null: false
    t.string "address", null: false
    t.string "fatherName"
    t.string "fatherOccupation"
    t.string "motherName"
    t.string "motherOccupation"
    t.string "guidance"
    t.string "parentContactNumber"
    t.integer "numberOfFamilyMember"
    t.integer "numberOfSisters"
    t.integer "numberOfBrothers"
    t.boolean "isDivorce"
    t.boolean "isDisable"
    t.boolean "isDomesticViolence"
    t.boolean "isSmoking"
    t.boolean "isAlcoholic"
    t.boolean "isDrug"
    t.string "houseType"
    t.string "collectiveIncome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
  end

end
