class PostsController < ApplicationController

  http_basic_authenticate_with name: "Keith", password: "lobsters", except: [:index, :show]

  def new
    @post = Post.new # this allows us to check for errors in our view and not have it blow up
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end  
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end