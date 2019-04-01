# frozen_string_literal: true

require_relative 'base'

module Sample
  class PersonalityCategory < Sample::Base
    def self.load(file, options = {})
      path = File.expand_path(csv_path + "#{file}.xlsx")
      xlsx = Roo::Spreadsheet.open(path)

      xlsx.each_with_pagename do |_sheet_name, sheet|
        sheet.parse.each do |row|
          code = row[0]
          name_en = row[1]
          name_km = row[2]
          description = row[3].to_s.strip.split(';').map(&:strip).join(';')
          group = row[4].downcase

          category = ::PersonalityCategory.find_or_initialize_by(code: code)
          category.update_attributes(name_en: name_en, name_km: name_km, group: group, description: description)
        end
      end

      puts "Loaded #{file.titleize} samples" if options[:verbose]
    end

    def self.export
      data = []
      ::PersonalityCategory.find_each do |record|
        obj = {
          code: record.code,
          name_en: record.name_en,
          name_km: record.name_km,
          group: record.group,
          description: record.description
        }

        data.push(obj)
      end

      write_to_file(data, 'personality_category')
    end
  end
end
