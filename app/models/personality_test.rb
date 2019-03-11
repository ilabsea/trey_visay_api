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
  has_many :personality_selections
  belongs_to :user
end
