require 'rails_helper'

RSpec.describe SubjectTip, type: :model do
  it { is_expected.to validate_presence_of(:subject_code) }
  it { is_expected.to validate_presence_of(:tip) }
  it { is_expected.to validate_presence_of(:tip_type) }
end
