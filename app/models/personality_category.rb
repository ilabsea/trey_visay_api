# frozen_string_literal: true
# == Schema Information
#
# Table name: personality_categories
#
#  code        :string(36)       not null, primary key
#  name_en     :string(255)
#  name_km     :string(255)
#  group       :string(255)
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PersonalityCategory < ApplicationRecord
  has_many :personality_category_personality_majors, foreign_key: :personality_category_code, dependent: :destroy
  has_many :personality_majors, through: :personality_category_personality_majors
end
