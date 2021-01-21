class Admin::BaseController < ApplicationController
  before_action :check_admin
  layout 'admin/layouts/application'

  private

  def check_admin
    redirect_to root_path unless current_user.admin?
  end

  def not_authenticated(msg = t('defaults.require_login'))
    redirect_to admin_login_path, error: msg
  end
end
