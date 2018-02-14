class UsersController < ApplicationController
  before_action :authenticate_account!
	before_action :authenticate_user_owner!
	expose(:user) { User.find(params[:id])}

  def show
    @user = User.find(params[:id])
  end

  def index
    @datas = users
    if(params[:school] && params[:school].strip != "")
      @datas = @datas.where("school_name = #{params[:school]}")
    end
    if(params[:grade] && params[:grade].strip != "")
      @datas = @datas.where("grade = #{params[:grade]}")
    end
  	@grades = User::GRADES
  	@schools = User.get_all_schools
  end

  private 
  def authenticate_user_owner!
  	head :forbidden unless ( current_account.role == Account::ROLE[0] or user.school_name == current_account.schools[0])
  end

end

