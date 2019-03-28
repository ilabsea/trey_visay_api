class CreatePersonalityMajors < ActiveRecord::Migration[5.1]
  def change
    create_table :personality_majors do |t|
      t.string :code, :string, limit: 36
      t.string :name_km
      t.string :group
      t.text   :description
      t.text   :conditions

      t.timestamps
    end
  end
end
