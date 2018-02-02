# frozen_string_literal: true

class HomeController < ApplicationController
  def index
  	@users = User.all
  	@grades = User::GRADES
  	@schools = User::SCHOOLS
  end
end
