# frozen_string_literal: true

require_relative 'execute'
require_relative 'university'
require_relative 'career'
require_relative 'high_school'

class Sample::TreyVisay
  def self.load_samples(options = {})
    options.reverse_merge!(verbose: true)

    Sample::Execute.load('accounts', options)
    Sample::Execute.load('subject_tips', options)
    Sample::Execute.load('entries', options)
    Sample::Execute.load('characteristic_jobs', options)
    Sample::Execute.load('vocational_jobs', options)

    Sample::University.load('government_schools', options.merge({category: 'សាលារដ្ឋ'}))
    Sample::University.load('private_schools', options.merge({category: 'សាលាឯកជន'}))
    Sample::University.load('ngo_schools', options.merge({category: 'អង្គការ'}))

    Sample::Career.load('career_science', options.merge({category: "បុគ្គលិកលក្ខណៈបុគ្គលបែប វិទ្យាសាស្រ្ត"}))
    Sample::Career.load('career_technical', options.merge({category: "បុគ្គលិកលក្ខណៈបុគ្គលបែប បច្ចេកទេស"}))
    Sample::Career.load('career_social', options.merge({category: "បុគ្គលិកលក្ខណៈបុគ្គល បែបសង្គម"}))
    Sample::Career.load('career_vocational', options.merge({group: 'Vocational', category: "វិជ្ជាជីវៈ"}))

    Sample::HighSchool.load('high_school', options)
  end
end
