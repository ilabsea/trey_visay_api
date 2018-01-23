require 'rails_helper'

RSpec.describe Career, type: :model do
  it { is_expected.to have_and_belong_to_many(:schools) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to have_and_belong_to_many(:games) }
  it { is_expected.to belong_to(:categorizable) }
end
