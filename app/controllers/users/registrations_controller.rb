class Users::RegistrationsController < Devise::RegistrationsController
  
  def new
    @type = params[:type]
    super
  end
  
  def edit
    super
  end
end