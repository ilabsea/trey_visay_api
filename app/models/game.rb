# frozen_string_literal: true
# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  reason     :string(255)
#  audio      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Game < ApplicationRecord
  belongs_to :user
  has_many :personal_understandings
  has_and_belongs_to_many :careers
  has_and_belongs_to_many :entries
end
