class AddDescription2ToCareers < ActiveRecord::Migration[5.1]
  def change
    add_column :careers, :description2, :text
    add_column :careers, :description3, :text
  end
end
