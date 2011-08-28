class ApplicationController < ActionController::Base
  protect_from_forgery
  include FrontendHelpers::Html5Helper
  
  if Rails.env == 'development'
     require_dependency( (Rails.root + "app/models/user").to_s )
   end
  
  def after_sign_in_path_for(resource)
    case resource.type
    when 'SchoolUser'; school_user_path
    when 'BusinessUser'; business_user_path
    else root_path
    end
  end
end
