class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    if @comment.save
      flash[:notice] = 'Comment was successfully created'
      redirect_to @post
    else
      render :new
    end
  end
end
