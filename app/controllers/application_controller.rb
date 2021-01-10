class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :info, :warning, :error

  protected

  def not_authenticated(msg = t('defaults.require_login'))
    redirect_to login_path, error: msg
  end
end
