class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  before_action :user_set, only: %i[edit update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_edit_params)
      redirect_to mypage_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render 'edit'
    end
  end

  private

  def user_set
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_edit_params
    params.require(:user).permit(:name, :email)
  end
end
