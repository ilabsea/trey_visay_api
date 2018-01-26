# frozen_string_literal: true
# == Schema Information
#
# Table name: characteristics
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  description :text(65535)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Characteristic < ApplicationRecord
  has_and_belongs_to_many :entries
  has_many :careers, as: :categorizable
  has_many :games
end
