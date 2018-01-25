# frozen_string_literal: true

module Api
  module V1
    class UsersController < ::Api::V1::ApplicationController
      # @Todo: remove index action
      def index
        @careers = Career.limit(5)
        render json: @careers, status: :ok
      end

      def create
        @data = UserGame.new(data_params)
        @data.save!

        render json: @data.user, serializer: serializer_klass, status: :created
      end

      private

      def data_params
        params.require(:data).require(:attributes).permit(
          :id, :full_name, :password, :username, :sex, :date_of_birth, :phone_number,
          :nationality, :school_name, :grade, :address, :father_name, :father_occupation,
          :mother_name, :mother_occupation, :guidance, :parent_contact_number,
          :number_of_family_member, :number_of_sisters, :number_of_brothers, :is_divorce,
          :is_disable, :is_domestic_violence, :is_smoking, :is_alcoholic, :is_drug,
          :house_type, :collective_income, :games
        )
      end
    end
  end
end
