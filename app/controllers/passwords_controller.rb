class PasswordsController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def edit
    not_authenticated if @user.blank?
    if @user&.authentications.present?
      redirect_to mypage_path, error: t('.error')
    end
  end

  def update
    return not_authenticated if @user.blank?
    return not_authenticated if @user&.authentications.present?
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password(params[:user][:password])
      redirect_to mypage_path, success: t('.success')
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end
end
