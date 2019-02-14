# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  uuid             :string(255)
#  full_name        :string(255)      not null
#  password         :string(255)      not null
#  username         :string(255)      not null
#  sex              :string(255)
#  date_of_birth    :date
#  phone_number     :string(255)
#  school_name      :string(255)
#  grade            :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  photo            :string(255)
#  high_school_code :string(255)
#

require 'csv'

class User < ApplicationRecord
  mount_uploader :photo, ::PhotoUploader

  GRADES = %w[9 10 11 12 ផ្សេងៗ].freeze

  belongs_to :high_school, foreign_key: :high_school_code, optional: true
  has_many :games
  has_many :personal_understandings, through: :games

  validates :grade, inclusion: { in: GRADES }, allow_nil: true

  def address
    return nil if high_school_code.blank?
    district = high_school.location
    "#{district.name_km} #{district.province.name_km}"
  end

  def self.filter(params)
    relation = all
    relation = relation.where(school_name: school_name(params[:school_id])) if params[:school_id].present?
    relation = relation.where(grade: params[:grade]) if params[:grade].present?
    relation
  end

  def self.all_schools
    file = File.join(Rails.root, 'public', 'school.csv')
    csv_text = File.read(file)
    csv = CSV.parse(csv_text, headers: true)
    schools = []
    csv.each do |row|
      schools.push(id: row[0], name: row[1])
    end
    schools
  end

  def self.school_name(id)
    all_schools.each do |school|
      return school[:name] if school[:id].to_s == id.to_s
    end
  end

  def self.all_schools_name
    names = []
    all_schools.each do |school|
      names.push school[:name]
    end
    names
  end
end
