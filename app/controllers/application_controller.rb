class ApplicationController < ActionController::Base
  include SessionsHelper
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
    # Hide portions of the site from non-admins
    def admin_only
      if !is_admin?
        flash[:error] = "Permission Denied"
        redirect_to root_url
      end
    end

    # Hide all user pages if user is not logged in
    def require_login
      if !logged_in?
        flash[:error] = "Please login first"
        redirect_to root_url
      end
    end

end
