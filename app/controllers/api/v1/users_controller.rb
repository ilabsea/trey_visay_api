# frozen_string_literal: true

class Api::V1::UsersController < ApiController
  def create
    params['data'] = JSON.parse(params['data'])
    @user = User.find_or_initialize_by(uuid: params['data']['uuid'])
    user_params = filter_params
    if user_params[:high_school_id]
      user_params[:school_name] = User.school_name(user_params[:high_school_id])
      user_params.delete :high_school_id
    end

    @user.photo = params[:photo] if params[:photo].present?

    if @user.update_attributes(user_params)
      render json: { success: true }
    else
      log = Log.new(user: params['data'])
      log.save!
      render json: { error: @user.errors }
    end
  end

  def me
    authenticate_or_request_with_http_basic do |username, password|
      if username == ENV['HTTP_BASIC_USER'] && password == ENV['HTTP_BASIC_PASSWORD']
        render json: { success: true }
      end
    end
  end

  def high_schools
    render json: User.all_schools
  end

  private

  def filter_params
    params.require(:data).permit(
      :id, :full_name, :password, :username, :sex, :date_of_birth, :phone_number,
      :nationality, :school_name, :grade, :address, :father_name, :father_occupation,
      :mother_name, :mother_occupation, :guidance, :parent_contact_number,
      :number_of_family_member, :number_of_sisters, :number_of_brothers, :is_divorce,
      :is_disable, :is_domestic_violence, :is_smoking, :is_alcoholic, :is_drug,
      :house_type, :collective_income, :uuid, :photo, :high_school_code, :province_code,
      :district_code, :commune_code
    )
  end
end
