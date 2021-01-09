class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :info, :warning, :error

  protected

  def not_authenticated
    redirect_to login_path, error: t('defaults.require_login')
  end
end
