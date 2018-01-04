# frozen_string_literal: true

module ApplicationHelper
  def css_id_name
    prefix = params['controller'].downcase.split('/').join('-')
    subfix = params['action']

    return "#{prefix}-#{subfix}"
  end
end
