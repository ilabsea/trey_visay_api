# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_account!
  before_action :authenticate_user_owner!
  expose(:user) { User.find(params[:id]) }

  def index
    @datas = User.filter(school_id: params[:school], grade: params[:grade])
    @grades = User::GRADES
    @schools = User.all_schools
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def authenticate_user_owner!
    head :forbidden unless (current_account.role == Account::ROLE[0]) || (user.school_name == current_account.schools[0])
  end
end
