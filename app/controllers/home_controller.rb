class HomeController < ApplicationController
  def index
    @users = User.all
  end
  
  def school
    @user_type = USER_TYPE_SCHOOL
    @schools = current_user.schools
  end
  
  def business
    @user_type = USER_TYPE_BUSINESS
    @users = BusinessUser.all
  end
end
