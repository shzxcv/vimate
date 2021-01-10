class OauthsController < ApplicationController
  skip_before_action :require_login, raise: false

  def oauth
    return redirect_to root_path, info: t('defaults.info') if logged_in?
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    if @user = login_from(provider)
      redirect_to root_path, success: "#{provider.titleize}アカウントでログインしました。"
    else
      begin
        @user = create_from(provider)
        reset_session
        auto_login(@user)
        redirect_to root_path, success: "#{provider.titleize}アカウントでログインしました。"
      rescue
        redirect_to root_path, error: "#{provider.titleize}アカウントでのログインに失敗しました。"
      end
    end
  end
end
