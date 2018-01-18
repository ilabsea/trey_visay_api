class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :user_id, null: false
      t.string  :reason, null: true
      t.string  :record, null: true
      t.integer :personal_understanding_id, null: true

      t.timestamps null: false
    end
  end
end
