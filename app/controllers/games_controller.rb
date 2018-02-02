# frozen_string_literal: true

class GamesController < ApplicationController
  def show
  	@user = User.find(params[:user_id])
    @game = Game.find(params[:id])
  end
end

