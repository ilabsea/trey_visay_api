# == Schema Information
#
# Table name: personality_tests
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PersonalityTest < ApplicationRecord
  belongs_to :user
  has_many :personality_selections
  has_many :personalities, through: :personality_selections
end
