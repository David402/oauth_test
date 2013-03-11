class AuthorizationController < ApplicationController
  ALL_PERMISSIONS = 'all_permissions'
  PICCOLLAGE_CLIENT_ID = 'piccollage'

  def authorize
    @client_id = params['client_id']
    @response_type = params['response_type']
    @scope = params['scope']
    @redirect_uri = params['redirect_uri']
    fb_access_token = params['fb_access_token']

    client_id ||= PICCOLLAGE_CLIENT_ID
    scope = ALL_PERMISSIONS if client_id == PICCOLLAGE_CLIENT_ID

    if fb_access_token
      
    else
      render 'login'
    end    
  end

  def login
    client_id = params['client_id']
    response_type = params['response_type']
    redirect_uri = params['redirect_uri']
    scope = params['scope']

    username = params['username']
    u = User.find_by_username username
    if u
      if u.password == params['password']
        
        if response_type == 'token'
          redirect_to "#{redirect_uri}##{}"
        end
      else
        @err_msg = "username '#{username}' and password does not match"
        render 'login'
      end
    else
      @err_msg = "user not found for: #{username}"
      render 'login'
    end
  end

  def signup
    render 'signup'
  end

  def post_signup

  end
end
