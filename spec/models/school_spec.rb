# == Schema Information
#
# Table name: schools
#
#  id                  :integer          not null, primary key
#  name                :string(255)      not null
#  logo                :string(255)
#  address             :string(255)
#  province            :string(255)
#  phone_numbers       :string(255)
#  faxes               :string(255)
#  emails              :string(255)
#  website_or_facebook :string(255)
#  mailbox             :string(255)
#  category            :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  code                :string(255)
#

require 'rails_helper'

RSpec.describe School, type: :model do
  it { is_expected.to have_and_belong_to_many(:careers) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_inclusion_of(:category).in_array(%w(សាលារដ្ឋ សាលាឯកជន អង្គការ)) }
end
