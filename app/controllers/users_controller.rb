# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_account!

  def index
    @users = User.filter(school_id: params[:school], grade: params[:grade]).includes(:games, :personal_understandings).page(page_params).per(20)
    @grades = User::GRADES
    @schools = User.all_schools
  end

  def show
    @user = User.find(params[:id])
  end
end
