# == Schema Information
#
# Table name: personality_selections
#
#  id                  :integer          not null, primary key
#  personality_code    :string(255)
#  personality_test_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class PersonalitySelection < ApplicationRecord
  belongs_to :personality
  belongs_to :personality_test
end
