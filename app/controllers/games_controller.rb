# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :authenticate_account!

  def show
    @user = User.find(params[:user_id])
    @game = Game.find(params[:id])
    @schools = @game.goal_career.schools.includes(:departments, :department_majors, :majors)
  end
end
