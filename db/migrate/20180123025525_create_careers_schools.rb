class CreateCareersSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :careers_schools do |t|
      t.belongs_to :career, index: true
      t.belongs_to :school, index: true
    end
  end
end
