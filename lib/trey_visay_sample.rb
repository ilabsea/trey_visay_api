# frozen_string_literal: true
require 'sample'

class TreyVisaySample
  def self.load_samples(options = {})
    options.reverse_merge!(verbose: true)

    Sample.load('accounts', options)
    # Sample.load('subject_tips', options)
  end
end
