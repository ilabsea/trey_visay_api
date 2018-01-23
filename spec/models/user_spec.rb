# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  uuid                    :string(255)      not null
#  full_name               :string(255)      not null
#  password                :string(255)      not null
#  username                :string(255)      not null
#  sex                     :string(255)      not null
#  date_of_birth           :date             not null
#  phone_number            :string(255)      not null
#  nationality             :string(255)      not null
#  school_name             :string(255)      not null
#  grade                   :string(255)      not null
#  address                 :string(255)      not null
#  father_name             :string(255)
#  father_occupation       :string(255)
#  mother_name             :string(255)
#  mother_occupation       :string(255)
#  guidance                :string(255)
#  parent_contact_number   :string(255)
#  number_of_family_member :integer
#  number_of_sisters       :integer
#  number_of_brothers      :integer
#  is_divorce              :boolean
#  is_disable              :boolean
#  is_domestic_violence    :boolean
#  is_smoking              :boolean
#  is_alcoholic            :boolean
#  is_drug                 :boolean
#  house_type              :string(255)
#  collective_income       :string(255)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:games) }
end
