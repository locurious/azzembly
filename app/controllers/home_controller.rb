class HomeController < ApplicationController
  def index
    @users = User.all
  end
  
  def school
    @users = SchoolUser.all
  end
  
  def business
    @users = BusinessUser.all
  end
end
