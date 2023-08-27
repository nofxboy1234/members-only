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
    true
  end
end
