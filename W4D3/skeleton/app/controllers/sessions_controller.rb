class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
    )

    if @user.nil?
      flash[:error] = "Unable to login"
      redirect_to new_session_url
    else
      login_user!(@user)
      flash[:success] = "Successfully Signed In"
    end
  end

  def destroy
    current_user.reset_session_token! if current_user
    session[:session_token] = nil
  end
end
