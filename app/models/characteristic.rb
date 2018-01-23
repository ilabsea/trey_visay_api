# frozen_string_literal: true

class Characteristic < ApplicationRecord
  has_and_belongs_to_many :entries
end
