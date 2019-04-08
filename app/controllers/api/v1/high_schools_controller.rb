# frozen_string_literal: true

class Api::V1::HighSchoolsController < ApiController
  def index
    high_schools = HighSchool.where(location_code: params[:district_id])

    render json: high_schools, status: :ok
  end

  def grades
    render json: User::grades, status: :ok
  end
end
