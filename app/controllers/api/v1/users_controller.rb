# frozen_string_literal: true

module Api
  module V1
    class UsersController < ::Api::V1::ApplicationController
      def index
        render json: [], status: :ok
      end

      def create; end
    end
  end
end
