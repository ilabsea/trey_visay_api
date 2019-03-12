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
  CATEGORIES = %w(realistic investigative artistic social enterprising conventional)

  has_many :personality_selections, foreign_key: :personality_code, dependent: :destroy
  validates :name_km, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }

  scope :realistic, -> { where(category: 'realistic') }
  scope :investigative, -> { where(category: 'investigative') }
  scope :artistic, -> { where(category: 'artistic') }
  scope :social, -> { where(category: 'social') }
  scope :enterprising, -> { where(category: 'enterprising') }
  scope :conventional, -> { where(category: 'conventional') }
end
