module ApplicationHelper
  def set_user_context
    @user_type || USER_TYPE_BUSINESS
  end
end
