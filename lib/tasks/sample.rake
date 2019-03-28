# frozen_string_literal: true

require 'pathname'
require 'sample'

if Rails.env.development? || Rails.env.test?
  namespace :sample do
    desc 'Clean db'
    task clean_db: :environment do
      require 'database_cleaner'

      DatabaseCleaner[:active_record].strategy = :truncation
      DatabaseCleaner[:active_record].start
      DatabaseCleaner[:active_record].clean
    end

    desc 'Loads sample data'
    task load: [:clean_db] do
      Sample::TreyVisay.load_samples
    end

    desc 'Export universities to json'
    task export_universities: :environment do
      Sample::University.export
    end

    desc 'Export careers to json'
    task export_careers: :environment do
      Sample::Career.export
    end

    desc 'Export high schools to json'
    task export_high_schools: :environment do
      Sample::HighSchool.export
    end

    desc 'Export provinces, districts, and commune to json'
    task export_locations: :environment do
      Sample::Location.export
    end

    desc 'Export personalities to json'
    task export_personality: :environment do
      Sample::Personality.export
    end
  end
end
