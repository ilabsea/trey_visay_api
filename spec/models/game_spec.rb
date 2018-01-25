# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  reason     :string(255)
#  audio      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Game, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:characteristic) }
  it { is_expected.to have_many(:personal_understandings) }
  it { is_expected.to have_and_belong_to_many(:careers) }
  it { is_expected.to have_and_belong_to_many(:entries) }
  it { is_expected.to have_one(:subject) }
end
