class HomeController < ApplicationController
  def index
    @users = User.all
  end
  
  def school
    @user_type = USER_TYPE_SCHOOL
    @school = current_user.school
  end
  
  def business
    @user_type = USER_TYPE_BUSINESS
    @users = BusinessUser.all
  end
end
