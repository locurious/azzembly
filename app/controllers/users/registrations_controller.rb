class Users::RegistrationsController < Devise::RegistrationsController
  
  def new
    @type = params[:user_type]
    super
  end
  
  def edit
    super
  end
end