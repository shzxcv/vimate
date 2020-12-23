class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :info, :warning, :danger

  protected

  def not_authenticated
    redirect_to login_path, danger: t('defaults.require_login')
  end
end
