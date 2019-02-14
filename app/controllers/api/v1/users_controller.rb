# frozen_string_literal: true

class Api::V1::UsersController < ApiController
  def create
    params['data'] = JSON.parse(params['data'])
    @user = User.find_by_uuid(params['data']['uuid'])
    user_params = filter_params

    if @user
      @user.update_attributes(user_params)
      @user.photo = params[:photo]
      @user.save!
      render json: @user, status: :ok
    else
      @user = User.new(user_params)
      @user.save!
      render json: @user, status: :created
    end
  end

  private

  def filter_params
    params.require(:data).permit(
      :id, :full_name, :password, :username, :sex, :date_of_birth, :phone_number,
      :nationality, :school_name, :grade, :address, :father_name, :father_occupation,
      :mother_name, :mother_occupation, :guidance, :parent_contact_number,
      :number_of_family_member, :number_of_sisters, :number_of_brothers, :is_divorce,
      :is_disable, :is_domestic_violence, :is_smoking, :is_alcoholic, :is_drug,
      :house_type, :collective_income, :uuid, :photo, :high_school_code, :province_code, :district_code
    )
  end
end
