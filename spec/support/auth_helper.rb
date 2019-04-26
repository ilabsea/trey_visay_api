module AuthHelper
  def http_login
    user = 'treyvisay'
    pw = '123456'
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
  end  
end
