class Api::SessionsController < ApplicationController
  before_action :require_user!

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user.nil?
      flash.now[:errors] = ["Incorrect username and/or password"]
      render :status => 404
    else
      login_user!(user)
      # redirect_to api_users_url
    end
  end

  def destroy
    if current_user == nil
      render :status => 404
    else
      render ({})
      logout_user!
    end

  end
end
