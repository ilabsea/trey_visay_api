# frozen_string_literal: true

module Api
  module V1
    class PersonalityTestsController < ::ApiController
      def create
        personality_test = PersonalityTest.new(personality_test_params)

        if personality_test.save
          render json: personality_test, status: :created
        else
          render json: personality_test.errors, status: :unprocessable_entity
        end
      end

      private

      def personality_test_params
        user = User.find_by(uuid: params['data']['user_uuid'])
        params.require(:data).permit(
          personality_selections_attributes: [:personality_code]
        ).merge(user_id: user.id)
      end
    end
  end
end
