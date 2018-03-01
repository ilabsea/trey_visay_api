class ChangeColumnScoreInPersonalUnderstandings < ActiveRecord::Migration[5.1]
  def change
    change_column :personal_understandings, :score, :integer
  end
end
