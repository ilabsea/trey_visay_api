class PersonalityCategoryCareer < ApplicationRecord
  self.table_name = 'personality_category_careers'

  belongs_to :career, foreign_key: :career_code, primary_key: :code
  belongs_to :personality_category, foreign_key: :personality_category_code
end
