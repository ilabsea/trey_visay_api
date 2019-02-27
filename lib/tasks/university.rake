namespace :university do
  desc "add value code to university"
  task :migrate_code => :environment do
    csv_path = Pathname.new(File.join(Dir.pwd, 'db', 'csv'));

    path = File.expand_path(csv_path + "university.xlsx")
    xlsx = Roo::Spreadsheet.open(path)

    xlsx.each_with_pagename do |name, sheet|
      sheet.parse.each_with_index do |row, index|
        unless row[0].nil?
          code = row[2]
          id = row[1].to_i
          school = School.find(id)
          school.code = code
          school.save!
        end
      end
    end
  end
end
