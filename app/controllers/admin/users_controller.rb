class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all.page(params[:page])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy!
    redirect_to admin_users_path, success: t('.success')
  end
end
