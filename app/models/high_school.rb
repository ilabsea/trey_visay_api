# frozen_string_literal: true

# == Schema Information
#
# Table name: high_schools
#
#  code          :string(7)        not null, primary key
#  name_km       :string(255)
#  name_en       :string(255)
#  location_code :string(255)
#
# Indexes
#
#  index_high_schools_on_code  (code) UNIQUE
#

class HighSchool < ApplicationRecord
  has_many :users, foreign_key: :high_school_code

  def location
    Pumi::District.find_by_id(location_code)
  end
end
