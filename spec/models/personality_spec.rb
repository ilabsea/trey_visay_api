require 'rails_helper'

RSpec.describe Personality, type: :model do
  it { is_expected.to have_many(:personality_selections) }
  it { is_expected.to validate_presence_of(:name_km) }
  it { is_expected.to validate_inclusion_of(:category).in_array(%w(realistic investigative artistic social enterprising conventional)) }
end
