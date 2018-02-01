# frozen_string_literal: true
require 'csv'

class SchoolSample
  def self.load(file, options = {})
    path = File.expand_path(csv_path + "#{file}.csv")
    csv = CSV.parse(File.read(path), headers: true)

    csv.each do |csv_row|
      row = csv_row.to_hash
      assign_school(row, options)
      assign_department(row)
      assign_major(row)
    end

    puts "Loaded #{file.titleize} samples" if options[:verbose]
  end

  private_class_method

  def self.assign_major(row)
    return if row['major'].blank?

    major = Major.new(name: row['major'], school: @previous_school)
    major.department = @previous_department if @previous_department.present?
    major.save
  end

  def self.assign_department(row)
    return if row['department_name'].blank?

    @previous_department = @previous_school.departments.create(name: row['department_name'])
  end

  def self.assign_school(row, options)
    return if row['name'].blank?

    @previous_department = nil
    @previous_school = School.create(
      name: row['name'],
      address: row['address'],
      province: row['province'],
      phone_numbers: strip_att(row['phone_numbers']),
      faxes: strip_att(row['faxes']),
      emails: strip_att(row['emails']),
      website_or_facebook: strip_att(row['website_or_facebook']),
      mailbox: row['mailbox'],
      category: options[:category] || 'សាលារដ្ឋ'
    )
  end

  def self.strip_att(val)
    val.to_s.split(';').each(&:strip!).join(';')
  end

  def self.csv_path
    Pathname.new(File.join(Dir.pwd, 'db', 'csv'))
  end
end
