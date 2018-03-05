# frozen_string_literal: true

class MajorSerializer < ActiveModel::Serializer
  attributes :id, :name, :department_id
end
