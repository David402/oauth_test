class ApiController < ApplicationController
  before_filter :find_auth

  def me
    resp = if @user
        {username: @user.username, email: @user.email}
      else
        {error: 'user not found'}
      end
    render json: resp
  end

  def find_auth
    @auth = Auth.find_by_access_token params['access_token']
    @user = @auth.user if @auth
  end
end
