class PasswordResetsController < ApplicationController
  skip_before_action :require_login

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    #外部認証は除外
    @user&.deliver_reset_password_instructions! if @user&.authentications.blank?
    redirect_to login_path, info: t('.info')
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)
    not_authenticated(t('.error')) if @user.blank?
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)
    return not_authenticated(t('.error')) if @user.blank?

    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password(params[:user][:password])
      redirect_to root_path, success: t('.success')
    else
      render 'edit'
    end
  end
end
