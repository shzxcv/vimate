class MypagesController < ApplicationController
  before_action :set_user, only: %i[show destroy remove]

  def show
  end

  def remove
    gon.password_input_flag = @user.authentications.present?
  end

  def destroy
    if User.authenticate(@user.email, params[:password]) || @user.authentications.present?
      @user.destroy
      redirect_to root_path, success: t('.success')
    else
      flash.now[:error] = t('.fail')
      render 'remove'
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end
end
