# frozen_string_literal: true

class DepartmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :school_id

  has_many :majors
end
