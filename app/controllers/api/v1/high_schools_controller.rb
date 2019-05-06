# frozen_string_literal: true

module Api
  module V1
    class HighSchoolsController < ::ApiController
      skip_before_action :http_basic_authentication

      def index
        high_schools = HighSchool.where(location_code: params[:district_id])

        render json: high_schools, status: :ok
      end

      def grades
        render json: User.grades, status: :ok
      end
    end
  end
end
