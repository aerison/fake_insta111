class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts=Post.all
  end

  def new
  end

  def create
    @post=Post.new(post_params)
    @post.save
    redirect_to '/'

    # @post=posts.new(post_params)
    # @post.save
    # flash[:notice]="success"
    # redirect_to '/'
  end

  def show
    @comments=@post.comments
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to "posts/#{@post.id}"
  end

  def destroy
    @post.destroy
    redirect_to '/'
  end

  private

  def set_post
    @post=Post.find(params[:id])
  end

  def post_params
    params.permit(:title, :content)
  end

end
