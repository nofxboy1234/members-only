class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_login, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    # @user = User.find(params[:user_id])
    @user = current_user
    @post = Post.new
  end

  def create
    # @user = User.find(params[:user_id]) # get user signed in
    @user = current_user # needed?
    # @post = @user.posts.create(post_params)
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to posts
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def require_login
    unless user_signed_in?
      # Get current action?
      flash[:error] = 'You must be logged in to do this!'
      redirect_to posts
    end
  end
end
