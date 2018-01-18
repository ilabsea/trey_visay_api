class CreateCharacteristics < ActiveRecord::Migration[5.1]
  def change
    create_table :characteristics do |t|
      t.string :title, null: false
      t.string :entries, null: false
      t.string :description, null: false

      t.timestamps null: false
    end
  end
end
