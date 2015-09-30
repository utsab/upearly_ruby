class UsersController < ApplicationController
  def index
    p "In index!!!!!!!!!!!!!!!!!!!!!!!!!!"

    @users = User.all
  end

  def new
  end

  def create
    @user = User.new(user_params)
    p "*" * 50
    p "creating new user! user params: #{user_params}"
    @user.save
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end

end
