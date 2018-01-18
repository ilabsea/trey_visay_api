class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string   :uuid, null: false
      t.string   :full_name,  null: false
      t.string   :password,  null: false
      t.string   :username,  null: false
      t.string   :sex,  null: false

      t.date     :dateOfBirth,  null: false
      t.string   :phoneNumber,  null: false
      t.string   :nationality,  null: false
      t.string   :schoolName,  null: false
      t.string   :grade,  null: false
      t.string   :address,  null: false

      t.string   :fatherName, null: true
      t.string   :fatherOccupation, null: true
      t.string   :motherName, null: true
      t.string   :motherOccupation, null: true
      t.string   :guidance, null: true
      t.string   :parentContactNumber, null: true
      t.integer  :numberOfFamilyMember, null: true
      t.integer  :numberOfSisters, null: true
      t.integer  :numberOfBrothers, null: true

      t.boolean  :isDivorce, null: true
      t.boolean  :isDisable, null: true
      t.boolean  :isDomesticViolence, null: true
      t.boolean  :isSmoking, null: true
      t.boolean  :isAlcoholic, null: true
      t.boolean  :isDrug, null: true
      t.string   :houseType, null: true
      t.string   :collectiveIncome, null: true

      t.timestamps null: false
    end
  end
end
