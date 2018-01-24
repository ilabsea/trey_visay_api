# frozen_string_literal: true
require 'sample'

class TreyVisaySample
  def self.load_samples(options = {})
    options.reverse_merge!(verbose: true)

    Sample.load('accounts', options)
    Sample.load('subject_tips', options)
    Sample.load('entries', options)
    Sample.load('characteristic_jobs', options)
    Sample.load('vocational_jobs', options)
    Sample.load('schools', options)
  end
end
