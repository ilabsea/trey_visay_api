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

  def self.export
    schools = []
    School.all.includes(:departments, :department_majors).each do |school|
      skool = {
        id: school.id,
        universityName: school.name,
        logoName: school.logo.file && school.logo.file.filename.split('.').first || '',
        address: school.address.to_s.gsub("<U+200B>", ''),
        province: school.province,
        phoneNumbers: school.phone_numbers.to_s.gsub("<U+200B>", '').split(';'),
        faxes: school.faxes.to_s.gsub("<U+200B>", '').split(';'),
        emails: school.emails.to_s.gsub("<U+200B>", '').split(';'),
        websiteOrFacebook: school.website_or_facebook.to_s.gsub("<U+200B>", '').split(';'),
        mailbox: school.mailbox,
        category: school.category,
        departments: school.departments.map { |department|
          { name: department.name.gsub("<U+200B>", ''), majors: department.majors.collect(&:name) }
        }
      }

      schools.push(skool)
    end

    ids = Major.where(department_id: nil).pluck(:school_id).uniq
    School.where(id: ids).includes(:majors).each do |school|
      sk = schools.find { |sk| sk[:id] == school.id }
      sk[:departments].push({ name: '', majors: school.majors.pluck(:name)})
    end

    write_to_file(schools)
  end

  # upload photo
  # https://github.com/carrierwaveuploader/carrierwave/wiki/How-to:-%22Upload%22-from-a-local-file
  def self.load_logo
    extensions = ['jpg', 'jpeg', 'png', 'gif']
    extensions.each do |extension|
      images = Dir.glob(Rails.root.join('lib', 'assets', 'school_logos', "*.#{extension}"))
      images.each do |image|
        id = File.basename(image).gsub(".#{extension}", '');
        school = School.where(id: id).first;
        if school.present?
          school.logo = Pathname.new(image).open;
          school.save
        end
      end
    end
  end

  private_class_method

  def self.write_to_file(schools)
    Dir.mkdir('public/db') unless File.exists?('public/db')
    file_path = Rails.root.join('public', 'db', 'schools.json')
    content = JSON.pretty_generate(schools)

    File.open(file_path, 'w') do |f|
      f.puts(content)
    end
  end

  def self.assign_major(row)
    return if row['major'].blank?

    major = Major.new(name: row['major'], school: @school)
    major.department = @department if @department.present?
    major.save
  end

  def self.assign_department(row)
    return if row['department_name'].blank?

    @department = @school.departments.create(
      name: row['department_name'].split('.').last.strip
    )
  end

  def self.assign_school(row, options)
    return if row['name'].blank?

    @department = nil
    @school = School.create(
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
