class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action  :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.order("CREATED_AT DESC")
  end
  
  #params переменная в которой все данные которые мы ввели
  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post #редирект перенаправляет на страницу
    else
      render "new" #render use for action на действие
    end
  end

  def edit; end

  def update # не гет запрос(патч)
    @post = Post.find(params[:id])
    if @post.update(post_params)#
      redirect_to @post
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end

#:post simbolpost(type of date)
#