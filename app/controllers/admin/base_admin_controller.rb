class Admin::BaseAdminController < ActionController::Base
  layout 'admin'

  helper_method :current_user
  before_filter :login_required

  private

  def login_required
    redirect_to admin_login_url unless logined?
  end

  def logined?
    !!current_user
  end

  def current_user
    @current_user ||= login_from_session || login_from_cookies unless defined? @current_user
    @current_user
  end

  def login_as user
    session[:user_id] = user.id
    @current_user = user
  end

  def login_from_access_token
  end

  def login_from_session
    if session[:user_id].present?
      begin
        User.find session[:user_id]
      rescue
        session[:user_id] = nil
      end
    end
  end

  def login_from_cookies
  end

  def logout
    session[:user_id] = nil
    @current_user = nil
  end
end
