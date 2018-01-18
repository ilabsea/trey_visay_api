# frozen_string_literal: true

class School < ApplicationRecord
  mount_uploader :logo, PhotoUploader
end
