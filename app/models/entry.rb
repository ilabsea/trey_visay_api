# frozen_string_literal: true

class Entry < ApplicationRecord
  has_and_belongs_to_many :characteristics
  has_and_belongs_to_many :games
end
