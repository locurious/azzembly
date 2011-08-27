class HomeController < ApplicationController
  def index
    @users = User.all
    @user_type = params[:type]
  end
end
