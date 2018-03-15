class SubsController < ApplicationController

  before_action :require_login
  # before_action :require_owner, only: [:edit, :update]

  def new
    @sub = Sub.new
    render :new
  end

  def edit
    @sub = Sub.find(params[:id])
    require_owner
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def index
    @subs = Sub.all
  end

  def update
    @sub = Sub.find(params[:id])
    require_owner
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def require_owner
    redirect_to  "/",
    notice: 'You dont have enough permissions to be here' unless current_user.id == @sub.moderator_id
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
