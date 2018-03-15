class PostsController < ApplicationController
  before_action :require_login
  before_action :require_owner, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
    render :new
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes!(post_params)
      # params[:post][:sub_ids].each do |sub_id|
      #   PostSub.create!(post_id: @post.id, sub_id: sub_id)
      # end
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def destroy
  end

  def create
    # params = {:title => "Tommy", :url, :content, :sub_ids}
    @post = Post.new(post_params)
    # debugger
    # post = Post.new
    # post.title=("Tommy")
    # post.sub_ids = ["", "1"]

    @post.author_id = current_user.id
    # @post.sub_id = params[:post][:sub_ids].first
    if @post.save
      sub_ids = params[:sub_ids]
      # params[:post][:sub_ids].each do |sub_id|
      #   PostSub.create!(post_id: @post.id, sub_id: sub_id)
      # end
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def require_owner
    post = current_user.posts.find_by(id: params[:id])
    unless post
      redirect_to  "/",
        notice: 'You dont have enough permissions to be here'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content)
  end
end
