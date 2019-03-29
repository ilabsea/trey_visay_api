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
          name_en = row[1]
          name_km = row[2]
          description = row[3]
          conditions = row[4].to_s.strip.split(';').map{ |condition| condition.strip }.join(';')
          group = row[5].downcase

          major = ::PersonalityMajor.find_or_initialize_by(code: code)
          major.update_attributes(
            name_en: name_en,
            name_km: name_km,
            group: group,
            description: description,
            conditions: conditions)
        end
      end

      puts "Loaded #{file.titleize} samples" if options[:verbose]
    end

    def self.export
      data = []
      ::PersonalityMajor.find_each do |record|
        obj = {
          code: record.code,
          name_en: record.name_en,
          name_km: record.name_km,
          description: record.description,
          conditions: record.conditions,
          group: record.group
        }

        data.push(obj)
      end

      write_to_file(data, 'personality_major')
    end
  end
end
