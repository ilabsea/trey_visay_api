class CreateCareers < ActiveRecord::Migration[5.1]
  def change
    create_table :careers do |t|
      t.string   :name,                 null: false
      t.string   :description
      t.string   :places_for_work
      t.integer  :category_id

      t.timestamps null: false
    end
  end
end
