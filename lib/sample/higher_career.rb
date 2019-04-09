# frozen_string_literal: true

require_relative 'base'

module Sample
  class HigherCareer < Sample::Base
    def self.load(file, options = {})
      path = File.expand_path(csv_path + "#{file}.xlsx")
      xlsx = Roo::Spreadsheet.open(path)

      xlsx.each_with_pagename do |_name, sheet|
        sheet.parse.each_with_index do |row, index|
          description2 = row[3]
          description3 = row[4].to_s.strip.split(';').map(&:strip).join(';')
          name = row[1]
          code = row[0]

          # @Todo: change by by id to find by code
          career = ::Career.find_or_initialize_by(name: name)
          career.update_attributes(description2: description2, description3: description3)
        end
      end

      puts "Loaded #{file.titleize} samples" if options[:verbose]
    end
  end
end
