# frozen_string_literal: true
# == Schema Information
#
# Table name: careers
#
#  id              :integer          not null, primary key
#  name            :string(255)      not null
#  description     :string(255)
#  places_for_work :string(255)
#  category_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#


class Career < ApplicationRecord

  validates :name, presence: true

end
