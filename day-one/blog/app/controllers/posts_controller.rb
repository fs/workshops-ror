class PostsController < ApplicationController
  def index
    @posts = Post.order('created_at DESC')
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.save
    flash[:notice] = 'Post was created successfully'
    redirect_to @post
  end

  def edit
    @post = Post.find(params[:id])
  end
end
