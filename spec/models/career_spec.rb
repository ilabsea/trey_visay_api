# == Schema Information
#
# Table name: careers
#
#  id                 :integer          not null, primary key
#  name               :string(255)      not null
#  description        :string(255)
#  places_for_work    :string(255)
#  categorizable_type :string(255)
#  categorizable_id   :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_careers_on_categorizable_type_and_categorizable_id  (categorizable_type,categorizable_id)
#

require 'rails_helper'

RSpec.describe Career, type: :model do
  it { is_expected.to have_and_belong_to_many(:schools) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to have_many(:career_games) }
  it { is_expected.to have_many(:games).through(:career_games) }
  it { is_expected.to belong_to(:categorizable) }
end
