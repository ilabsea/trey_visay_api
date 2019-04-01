# frozen_string_literal: true

class Api::V1::HighSchoolsController < ApiController
  skip_before_action :http_basic_authentication

  def index
    high_schools = HighSchool.where(location_code: params[:district_id])

    render json: high_schools, status: :ok
  end

  def grades
    render json: User.grades, status: :ok
  end
end
