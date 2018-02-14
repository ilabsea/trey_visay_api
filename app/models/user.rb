# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  uuid                    :string(255)
#  full_name               :string(255)      not null
#  password                :string(255)      not null
#  username                :string(255)      not null
#  sex                     :string(255)      not null
#  date_of_birth           :date             not null
#  phone_number            :string(255)      not null
#  nationality             :string(255)      not null
#  school_name             :string(255)      not null
#  grade                   :string(255)      not null
#  address                 :string(255)      not null
#  father_name             :string(255)
#  father_occupation       :string(255)
#  mother_name             :string(255)
#  mother_occupation       :string(255)
#  guidance                :string(255)
#  parent_contact_number   :string(255)
#  number_of_family_member :integer
#  number_of_sisters       :integer
#  number_of_brothers      :integer
#  is_divorce              :boolean
#  is_disable              :boolean
#  is_domestic_violence    :boolean
#  is_smoking              :boolean
#  is_alcoholic            :boolean
#  is_drug                 :boolean
#  house_type              :string(255)
#  collective_income       :string(255)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  photo                   :string(255)
#

require 'csv'

class User < ApplicationRecord
  mount_uploader :photo, ::PhotoUploader

  GRADES = %w[9 10 11 12 ផ្សេងៗ].freeze

  HOUSE_TYPES = %w[ផ្ទះឈើ ផ្ទះឈើលើថ្មក្រោម ផ្ទះថ្ម ផ្ទះស័ង្កសី ផ្ទះស្លឹក].freeze

  has_many :games

  validates :grade, inclusion: { in: GRADES }
  validates :house_type, inclusion: { in: HOUSE_TYPES }

  def self.get_all_schools
    file = File.join(Rails.root, 'public', 'school.csv')
    csv_text = File.read(file)
    csv = CSV.parse(csv_text, :headers => true)
    schools = []
    csv.each do |row|
      schools.push({:id => row[0], :name => row[1]})
    end
    return schools
  end

  def self.get_school_name id
    get_all_schools.each do |school|
      if school[:id].to_s == id.to_s
        return school[:name]
      end
    end
  end

  def self.get_all_schools_name
    name = []
    get_all_schools.each do |school|
      name.push school[:name]
    end
    return name
  end

end
