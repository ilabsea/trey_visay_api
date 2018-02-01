# frozen_string_literal: true
require 'csv'

class SchoolSample
  def self.load(file, options = {})
    path = File.expand_path(csv_path + "#{file}.csv")
    csv = CSV.parse(File.read(path), headers: true)

    previous_school = nil
    previous_department = nil

    csv.each do |csv_row|
      row = csv_row.to_hash

      if row['name'].present?
        school = assign_school(row, options)
        school.save

        previous_school = school
        previous_department = nil

        if department_name = row['department_name'].presence
          department = school.departments.new(name: department_name)
          department.save

          previous_department = department
        end

        major = Major.new(name: row['major'], school: school)
        major.department = department if department.present?
        major.save
      elsif row['department_name'].present?
        department = previous_school.departments.new(name: row['department_name'])
        department.save

        previous_department = department
      elsif row['major'].present?
        major = Major.new(name: row['major'], school: previous_school)
        major.department = previous_department if previous_department.present?
        major.save
      end
    end

    puts "Loaded #{file.titleize} samples" if options[:verbose]
  end

  private_class_method

  def self.assign_school(row, options)
    School.new(
      name: row['name'],
      address: row['address'],
      province: row['province'],
      phone_numbers: row['phone_numbers'].to_s.split(';').each(&:strip!).join(';'),
      faxes: row['faxes'].to_s.split(';').each(&:strip!).join(';'),
      emails: row['emails'].to_s.split(';').each(&:strip!).join(';'),
      website_or_facebook: row['website_or_facebook'].to_s.split(';').each(&:strip!).join(';'),
      mailbox: row['mailbox'],
      category: options[:category] || 'សាលារដ្ឋ'
    )
  end

  def self.csv_path
    Pathname.new(File.join(Dir.pwd, 'db', 'csv'))
  end
end
