# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :authenticate_account!
	before_action :authenticate_game_owner!

	expose(:game) { Game.find(params[:id])}
  def show
  	@user = User.find(params[:user_id])
    @game = Game.find(params[:id])
  end


  private

  def authenticate_game_owner!
  	head :forbidden unless ( current_account.role == Account::ROLE[0] or game.user.school_name == current_account.schools[0])
  end
end

