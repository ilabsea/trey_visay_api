# == Schema Information
#
# Table name: personalities
#
#  code       :string(36)       not null, primary key
#  name_km    :string(255)
#  name_en    :string(255)
#  category   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_personalities_on_code  (code) UNIQUE
#

class Personality < ApplicationRecord
  CATEGORIES = %w(Realistic Investigative Artistic Social Enterprising Conventional)

  has_many :personality_selections, foreign_key: :personality_code
  validates :name_km, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
end
