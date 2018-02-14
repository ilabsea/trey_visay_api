class CreateCareers < ActiveRecord::Migration[5.1]
  def change
    create_table :careers do |t|
      t.string     :name,                 null: false
      t.text       :description
      t.string     :places_for_work
      t.references :categorizable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
