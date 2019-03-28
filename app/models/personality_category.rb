# == Schema Information
#
# Table name: personality_categories
#
#  id          :integer          not null, primary key
#  code        :string(36)
#  string      :string(36)
#  name_en     :string(255)
#  name_km     :string(255)
#  group       :string(255)
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PersonalityCategory < ApplicationRecord
end
