
class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    Post.find(params[:id]).destroy

    redirect_to "/posts"
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = session[:user_id]
    post.save


    redirect_to "/posts"
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])

    post.update_attributes(post_params)

    redirect_to :back
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
