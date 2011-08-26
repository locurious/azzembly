class HomeController < ApplicationController
  def index
    @users = User.all
    @user_type = params[:user_type]
  end
end
