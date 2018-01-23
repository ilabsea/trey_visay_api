require 'rails_helper'

RSpec.describe Game, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:personal_understandings) }
  it { is_expected.to have_and_belong_to_many(:careers) }
  it { is_expected.to have_and_belong_to_many(:entries) }
end
