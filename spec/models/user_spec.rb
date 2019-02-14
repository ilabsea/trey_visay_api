require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:games) }
  it { is_expected.to validate_inclusion_of(:grade).in_array(%w(9 10 11 12 ផ្សេងៗ)) }
end
