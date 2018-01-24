# frozen_string_literal: true

class SubjectTip < ApplicationRecord
  validates :subject_code, presence: true
  validates :tip, presence: true
  validates :tip_type, presence: true
end
