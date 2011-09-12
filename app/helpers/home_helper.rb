module HomeHelper
  def business_exists?
    current_user.business
  end
end
