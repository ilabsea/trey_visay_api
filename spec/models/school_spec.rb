require 'rails_helper'

RSpec.describe School, type: :model do
  it { is_expected.to have_and_belong_to_many(:careers) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_inclusion_of(:category).in_array(%w(សាលារដ្ឋ សាលាឯកជន អង្គការ)) }
end
