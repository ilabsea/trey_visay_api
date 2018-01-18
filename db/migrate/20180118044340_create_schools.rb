class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string   :name,                 null: false
      t.string   :logo,                 null: true
      t.string   :address,              null: true
      t.string   :province,             null: true
      t.string   :phoneNumbers,         null: true
      t.string   :faxes,                null: true
      t.string   :emails,               null: true
      t.string   :websiteOrFacebook,    null: true
      t.string   :mailbox,              null: true
      t.string   :category,             null: true

      t.timestamps null: false
    end
  end
end
