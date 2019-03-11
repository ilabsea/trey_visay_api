require 'rails_helper'

RSpec.describe PersonalityTest, type: :model do
  it { is_expected.to have_many(:personality_selections) }
  it { is_expected.to belong_to(:user) }
end
