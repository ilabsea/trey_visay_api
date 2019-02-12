# frozen_string_literal: true

require_relative 'base'

module Sample
  class HighSchool < Sample::Base
    def self.load(file, options = {})
      path = File.expand_path(csv_path + "#{file}.csv")
      csv = CSV.parse(File.read(path), headers: true)

      csv.each do |csv_row|
        row = csv_row.to_hash

        ::HighSchool.create(
          code: row['code'],
          name_km: row['label'],
          name_en: row['name_en'],
          location_code: row['parent_code']
        )
      end

      puts "Loaded #{file.titleize} samples" if options[:verbose]
    end

    def self.export
      schools = []
      ::HighSchool.find_each do |school|
        skool = {
          code: school.code,
          label: school.name_km,
          name_en: school.name_en,
          parent_code: school.location_code
        }

        schools.push(skool)
      end

      write_to_file(schools, 'highSchools')
    end
  end
end
