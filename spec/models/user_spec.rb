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
  let(:school_names) {
    ['សាលាជំនាន់ថ្មីវិទ្យាល័យព្រះស៊ីសុវត្ថិ', 'វិទ្យាល័យជាស៊ីមព្រែកអញ្ចាញ',
    'វិទ្យាល័យព្រែកលៀប', 'វិទ្យាល័យហ៊ុនសែនកំពង់ចាម',
    'អនុវិទ្យាល័យគោកព្រីង', 'វិទ្យាល័យសម្តេចតេជោហ៊ុនសែនសណ្តែក',
    'វិទ្យាល័យហោណាំហុងព្រៃញា', 'វិទ្យាល័យល្វា',
    'វិទ្យាល័យហ.សពាមជីកង', 'អនុវិទ្យាល័យហ.សទួលសុភី',
    'វិទ្យាល័យហ.សក្រូចឆ្មារ', 'វិទ្យាល័យសម្តេចហ៊ុនសែនប៉ើសពីរ',
    'វិទ្យាល័យប៊ុនរ៉ានីហ៊ុនសែនអម្ពវ័នជំនីក', 'វិទ្យាល័យជីហែ',
    'វិទ្យាល័យក្រុមព្រះមហាលាភ', 'ផ្សេងៗ']
  }

  it { is_expected.to have_many(:games) }
  it { is_expected.to validate_inclusion_of(:school_name).in_array(school_names) }
  it { is_expected.to validate_inclusion_of(:grade).in_array(%w(9 10 11 12 ផ្សេងៗ)) }
  it { is_expected.to validate_inclusion_of(:house_type).in_array(%w(ផ្ទះឈើ ផ្ទះឈើលើថ្មក្រោម ផ្ទះថ្ម ផ្ទះស័ង្កសី ផ្ទះស្លឹក)) }
end
