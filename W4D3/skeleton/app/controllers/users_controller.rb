class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      flash[:success] = "Successfully Created Account"
    else
      flash[:error] = "Unable to create an account"
      redirect_to users_new_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
