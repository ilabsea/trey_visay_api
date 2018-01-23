# frozen_string_literal: true
# == Schema Information
#
# Table name: entries
#
#  id   :integer          not null, primary key
#  name :string(255)      not null
#


class Entry < ApplicationRecord
  has_and_belongs_to_many :characteristics
  has_and_belongs_to_many :games
end
