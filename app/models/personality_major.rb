# == Schema Information
#
# Table name: personality_majors
#
#  id          :integer          not null, primary key
#  code        :string(36)
#  string      :string(36)
#  name_km     :string(255)
#  group       :string(255)
#  description :text(65535)
#  conditions  :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PersonalityMajor < ApplicationRecord
end
