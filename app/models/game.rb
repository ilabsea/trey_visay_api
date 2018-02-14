# frozen_string_literal: true

# == Schema Information
#
# Table name: games
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  characteristic_id :integer
#  reason            :string(255)
#  audio             :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Game < ApplicationRecord
  belongs_to :user
  belongs_to :characteristic
  has_many :personal_understandings
  has_many :career_games
  has_many :careers, through: :career_games
  has_and_belongs_to_many :entries
  has_one :subject

  mount_uploader :audio, ::AudioUploader
end
