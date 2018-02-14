# frozen_string_literal: true
require 'sample'
require 'school_sample'
require 'career_sample'

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

    # CareerSample.load('career_science', options.merge({category: "បុគ្គលិកលក្ខណៈបុគ្គលបែប វិទ្យាសាស្រ្ត"}))
    CareerSample.load('career_technical', options.merge({category: "បុគ្គលិកលក្ខណៈបុគ្គលបែប បច្ចេកទេស"}))
    # CareerSample.load('career_social', options.merge({category: "បុគ្គលិកលក្ខណៈបុគ្គល បែបសង្គម"}))
    # CareerSample.load('career_vocational', options.merge({category: "វិជ្ជាជីវៈ"}))
  end
end
