class Admin::BaseAdminController < ActionController::Base
  layout 'admin'
  before_filter :login_required

  private

  def login_required
  end
end
