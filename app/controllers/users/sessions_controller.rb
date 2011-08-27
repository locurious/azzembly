class Users::SessionsController < Devise::SessionsController
  
  def new
    @type = params[:type] || params[:user][:type]
    super
  end
  
  
end