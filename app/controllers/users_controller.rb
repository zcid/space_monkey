class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  private
    def set_user
      params.require(:user).permit(:username)
    end
end
