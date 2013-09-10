class Admin::SessionsController < Admin::BaseAdminController
  layout false
  skip_before_filter :login_required

  def new
    if logined?
      redirect_to admin_root_url
    end
  end

  def create
    # p request.env['omniauth.auth']
    user = User.first
    login_as user
    redirect_to admin_root_url
  end

  def destroy
    logout
    redirect_to admin_login_path
  end
end
