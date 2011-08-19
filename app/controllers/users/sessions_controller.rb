class Users::SessionsController < Devise::SessionsController
  
  def new
    @type = params[:user_type] || params[:user][:user_type]
    super
  end
  
  
end