class UsersController < ApplicationController

	before_action :authenticate_user_owner!
	expose(:user) { User.find(params[:id])}

  def show
    @user = User.find(params[:id])
  end

  def index
  	@grades = User::GRADES
  	@schools = User::SCHOOLS
  end

  private 
  def authenticate_user_owner!
  	head :forbidden unless ( current_account.role == Account::ROLE[0] or user.school_name == current_account.schools[0])
  end

end

