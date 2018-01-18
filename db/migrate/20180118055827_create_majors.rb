class CreateMajors < ActiveRecord::Migration[5.1]
  def change
    create_table :majors do |t|
      t.string :name, null: false
      t.integer :department_id, null: true

      t.timestamps null: false
    end
  end
end
