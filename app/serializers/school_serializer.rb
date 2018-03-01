# frozen_string_literal: true

class SchoolSerializer < ActiveModel::Serializer
  attributes :id, :name, :logo, :address, :province, :phone_numbers, :faxes, :emails, :website_or_facebook, :mailbox, :category

  has_many :departments
end
