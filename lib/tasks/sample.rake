# frozen_string_literal: true

require 'pathname'
require 'sample'
require 'trey_visay_sample'
require 'school_sample'

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
      TreyVisaySample.load_samples
    end

    desc 'Export school to json'
    task export_schools: :environment do
      SchoolSample.export
    end
  end
end
