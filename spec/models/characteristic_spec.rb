# == Schema Information
#
# Table name: characteristics
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  description :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Characteristic, type: :model do
  it { is_expected.to have_and_belong_to_many(:entries) }
  it { is_expected.to have_many(:careers) }
  it { is_expected.to have_many(:games) }
end
