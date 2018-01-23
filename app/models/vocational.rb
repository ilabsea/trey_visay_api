# frozen_string_literal: true

# == Schema Information
#
# Table name: vocationals
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  description :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Vocational < ApplicationRecord
  has_many :careers, as: :categorizable
end
