class Api::V1::TokensController < ApplicationController
  before_filter :authenticate_user!

  def index 
    render :json => {:token => current_account.authentication_token}
  end

  def destroy
    current_account.reset_authentication_token!
  end
  
end
