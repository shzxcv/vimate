class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    return redirect_to root_path, info: t('defaults.info') if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to root_path, success: t('.success')
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :agreement)
  end
end
