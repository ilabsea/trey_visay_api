# frozen_string_literal: true

require_relative 'base'

module Sample
  class Location < Sample::Base
    def self.export
      self.export_provinces
      self.export_districts
      self.export_communes
    end

    def self.export_provinces
      data = []
      Pumi::Province.all.each do |record|
        obj = {
          code: record.id,
          label: record.name_km,
          name_en: record.name_en,
          parent_code: nil
        }

        data.push(obj)
      end

      write_to_file(data, 'provinces')
    end

    def self.export_districts
      data = []
      Pumi::District.all.each do |record|
        obj = {
          code: record.id,
          label: record.name_km,
          name_en: record.name_en,
          parent_code: record.province_id
        }

        data.push(obj)
      end

      write_to_file(data, 'districts')
    end

    def self.export_communes
      data = []
      Pumi::Commune.all.each do |record|
        obj = {
          code: record.id,
          label: record.name_km,
          name_en: record.name_en,
          parent_code: record.district_id
        }

        data.push(obj)
      end

      write_to_file(data, 'communes')
    end
  end
end
