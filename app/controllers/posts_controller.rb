class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    @new_post = Post.new
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_path
    else
      render :new 
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit 
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url 
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:author_id, :is_answer, :answer_to, :post_content)
    end
end
