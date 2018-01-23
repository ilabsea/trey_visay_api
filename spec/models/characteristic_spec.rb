require 'rails_helper'

RSpec.describe Characteristic, type: :model do
  it { is_expected.to have_and_belong_to_many(:entries) }
end
