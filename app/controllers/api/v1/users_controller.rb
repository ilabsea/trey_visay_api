class Api::V1::UsersController < ApiController
  def index
    @careers = Career.all

    render json: @careers.to_json
  end

  def create
    params["data"] = JSON.parse(params["data"])
    @user = User.new(filter_params)
    @user.save!
    render json: @user, status: :created
  end

  private

  def filter_params
    params.require(:data).require(:attributes).permit(
      :id, :full_name, :password, :username, :sex, :date_of_birth, :phone_number,
      :nationality, :school_name, :grade, :address, :father_name, :father_occupation,
      :mother_name, :mother_occupation, :guidance, :parent_contact_number,
      :number_of_family_member, :number_of_sisters, :number_of_brothers, :is_divorce,
      :is_disable, :is_domestic_violence, :is_smoking, :is_alcoholic, :is_drug,
      :house_type, :collective_income
    )
  end
end



