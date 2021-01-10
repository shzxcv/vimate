class ApplicationController < ActionController::Base
  rescue_from StandardError, with: :render_500
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  before_action :require_login
  add_flash_types :success, :info, :warning, :error

  protected

  def not_authenticated(msg = t('defaults.require_login'))
    redirect_to login_path, error: msg
  end

  def render_500(error)
    logger.error(error.message)
    logger.error(error.backtrace.join("\n"))
    render file: Rails.root.join('public/500.html'), status: 500, layout: false, content_type: 'text/html'
  end

  def render_404
    render file: Rails.root.join('public/404.html'), status: 404, layout: false, content_type: 'text/html'
  end
end
