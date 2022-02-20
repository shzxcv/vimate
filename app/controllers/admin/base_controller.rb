class Admin::BaseController < ApplicationController
  before_action :basic_auth, :check_admin
  layout 'admin/layouts/application'

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def check_admin
    redirect_to root_path unless current_user.admin?
  end

  def not_authenticated(msg = t('defaults.require_login'))
    redirect_to admin_login_path, error: msg
  end
end
