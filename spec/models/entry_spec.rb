require 'rails_helper'

RSpec.describe Entry, type: :model do
  it { is_expected.to have_and_belong_to_many(:characteristics) }
  it { is_expected.to have_and_belong_to_many(:games) }
end
