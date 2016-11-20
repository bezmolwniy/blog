class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.order("created_at DESC")
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Post was successfully created!"
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was updated"
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: "Post was deleted"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body) #нужно для сеттеров и геттеров
  end

  def find_post
    @post = Post.find(params[:id])
  end
end