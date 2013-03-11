class AuthorizationController < ApplicationController
  def authorize
    @client_id = params['client_id']
    @response_type = params['response_type']
    @scope = params['scope']
    @redirect_uri = params['redirect_uri']
    render 'login'
  end

  def login
    client_id = params['client_id']
    response_type = params['response_type']
    redirect_uri = params['redirect_uri']
    scope = params['scope']
    username = params['username']

    client = Client.find client_id
    u = User.find_by_username username
    if u
      if u.password == params['password']
        a = Auth.with_updated_access_token client, u, scope
        if response_type == 'token'
          fragment = "access_token=#{a.access_token}&expires_in=#{a.expires_in}"
          redirect_to "#{redirect_uri}##{fragment}"
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
    username = params['username']
    password = params['password']

    @user = User.find_by_username username
    if @user
      @err_msg = "username '#{username}' has been used"
      render "signup"
    else
      @user = User.create(username: username, password: password)
      session[:user_id] = @user.id
      redirect_to "/"
    end
  end
end
