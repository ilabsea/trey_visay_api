class CreatePersonalityCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :personality_categories do |t|
      t.string :code, :string, limit: 36
      t.string :name_en
      t.string :name_km
      t.string :group
      t.text   :description

      t.timestamps
    end
  end
end
