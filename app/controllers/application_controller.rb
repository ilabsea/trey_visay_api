# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  expose(:user)
  expose(:games) { user.games}
  expose(:users){
    if current_account
      # public collections are accesible by all users
      # here we only need the ones in which current_user is a member
      current_account.users
    else
      User.all
    end
  }

  def authenticate_admin_user!
  	head :forbidden unless current_account.role == Account::ROLE[0]
  end

  def authenticate_api_user!
    params.delete :auth_token if current_account
    unless current_account
      basic_authentication_check
    end
  end

  def basic_authentication_check
    account = Account.find_by_authentication_token(params.delete :auth_token) and sign_in account
    http_basic_authentication unless account
  end

  def http_basic_authentication
    authenticate_or_request_with_http_basic do |email, password|
      resource = Account.find_by_email(email)
      if resource && resource.valid_password?(password)
        sign_in resource
        true
      else
        head :forbidden
      end
    end
  end

  def set_request_header
    headers['Access-Control-Allow-Origin'] = '*'
  end

  def render_json(object, options = {})
    options = options.merge(text: object.to_json_oj, content_type: 'application/json')
    render options
  end

end
