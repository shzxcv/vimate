class ProfilesController < ApplicationController
  before_action :user_set, only: %i[edit update]

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to mypage_path, success: t('.success')
    else
      render 'edit'
    end
  end

  private

  def user_set
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :avatar_cache)
  end
end
