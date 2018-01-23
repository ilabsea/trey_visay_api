# == Schema Information
#
# Table name: careers
#
#  id              :integer          not null, primary key
#  name            :string(255)      not null
#  description     :string(255)
#  places_for_work :string(255)
#  category_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Career, type: :model do
  it { is_expected.to have_and_belong_to_many(:schools) }
  it { is_expected.to validate_presence_of(:name) }
end
