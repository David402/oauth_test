class MainController < ApplicationController
  def index
    @user = User.find_by_id session[:user_id]
    render 'index'
  end
end
