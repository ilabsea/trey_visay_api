# frozen_string_literal: true

class SubjectTip < ApplicationRecord
  scope :subject_by, -> (code) { where(subject_code: code) }
  scope :mediums, -> { where(tip_type: 'medium') }
  scope :poors, -> { where(tip_type: 'poor') }

  validates :subject_code, presence: true
  validates :tip, presence: true
  validates :tip_type, presence: true
end
