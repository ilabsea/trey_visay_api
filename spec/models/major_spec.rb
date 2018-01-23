require 'rails_helper'

RSpec.describe Major, type: :model do
  it { is_expected.to belong_to(:school) }
  it { is_expected.to belong_to(:department) }
  it { is_expected.to validate_presence_of(:name) }
end