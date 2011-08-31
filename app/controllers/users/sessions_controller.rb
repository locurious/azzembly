class Users::SessionsController < Devise::SessionsController
  
  def new
    @user_type = params[:type] || params[:user][:type]
    superdevel
  end
  
  
end
