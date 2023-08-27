class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id]) # get user signed in
    @post = @user.posts.create(post_params)
    redirect_to posts
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def require_login
    true
  end
end
