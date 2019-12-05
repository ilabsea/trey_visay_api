# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_account!

  def index
    @users = User.filter(params).includes(:games, :personal_understandings).page(page_params).per(20)
  end

  def download
    @users = User.filter(params).includes(:games, :personal_understandings)

    send_data(::AssessmentResultService.new(@users).zip_data, type: 'application/zip', filename: 'assessment_result.zip')
  end

  def show
    @user = User.find(params[:id])
  end
end
