# frozen_string_literal: true

# == Schema Information
#
# Table name: personality_majors
#
#  code                :string(36)       not null, primary key
#  name_en             :string(255)
#  name_km             :string(255)
#  basic_knowledge     :string(255)
#  study_credit        :string(255)
#  recieved_knowledge  :text(65535)
#  possible_workplaces :text(65535)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class PersonalityMajor < ApplicationRecord
  has_many :personality_category_personality_majors, foreign_key: :personality_major_code, dependent: :destroy
  has_many :personality_categories, through: :personality_category_personality_majors
end
