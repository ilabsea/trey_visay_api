# frozen_string_literal: true
require 'sample'
require 'school_sample'

class TreyVisaySample
  def self.load_samples(options = {})
    options.reverse_merge!(verbose: true)

    Sample.load('accounts', options)
    Sample.load('subject_tips', options)
    Sample.load('entries', options)
    Sample.load('characteristic_jobs', options)
    Sample.load('vocational_jobs', options)

    SchoolSample.load('government_schools', options.merge({category: 'សាលារដ្ឋ'}))
    SchoolSample.load('ngo_schools', options.merge({category: 'អង្គការ'}))
    SchoolSample.load('private_schools', options.merge({category: 'សាលាឯកជន'}))
  end
end
