class Api::V1::UsersController < ApiController
  def index
    @careers = Career.all
    render json: @careers.to_json
  end

  def create
    params["data"] = JSON.parse(params["data"])
    @user = User.find_by_uuid(params["data"]["uuid"])
    user_params = filter_params
    if user_params[:high_school_id]
      user_params[:school_name] = User.get_school_name(user_params[:high_school_id])
      user_params.delete :high_school_id
    end
    unless @user
      @user = User.new(user_params)
      @user.save!
      render json: @user, status: :created
    else
      @user.update_attributes(user_params)
      @user.photo = params[:photo]
      @user.save!
      render json: @user, status: :ok
    end
    
  end

  def high_schools
    render json: User.get_all_schools
  end



  private

  def filter_params
    params.require(:data).permit(
      :id, :full_name, :password, :username, :sex, :date_of_birth, :phone_number,
      :nationality, :school_name, :grade, :address, :father_name, :father_occupation,
      :mother_name, :mother_occupation, :guidance, :parent_contact_number,
      :number_of_family_member, :number_of_sisters, :number_of_brothers, :is_divorce,
      :is_disable, :is_domestic_violence, :is_smoking, :is_alcoholic, :is_drug,
      :house_type, :collective_income, :uuid, :photo, :high_school_id
    )
  end
end



