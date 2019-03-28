# frozen_string_literal: true

require_relative 'base'

module Sample
  class PersonalityMajor < Sample::Base
    def self.load(file, options = {})
      path = File.expand_path(csv_path + "#{file}.xlsx")
      xlsx = Roo::Spreadsheet.open(path)

      xlsx.each_with_pagename do |sheet_name, sheet|
        sheet.parse.each do |row|
          code = row[0]
          name_km = row[1]
          group = sheet_name.downcase
          description = row[2]
          conditions = row[3]

          major = ::PersonalityMajor.find_or_initialize_by(code: code)
          major.update_attributes(name_km: name_km, group: group, description: description, conditions: conditions)
        end
      end

      puts "Loaded #{file.titleize} samples" if options[:verbose]
    end

    def self.export
      data = []
      ::PersonalityMajor.find_each do |record|
        obj = {
          code: record.code,
          name_km: record.name_km,
          group: record.group,
          description: record.description,
          conditions: record.conditions
        }

        data.push(obj)
      end

      write_to_file(data, 'personality_major')
    end
  end
end
