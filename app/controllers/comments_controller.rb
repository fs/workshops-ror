class CommentsController < ApplicationController
  def create
    decision = Decision.find(params[:decision_id])
    comment = decision.comments.build(params[:comment])
    comment.user = current_user
    
    if comment.save
      redirect_to decision, notice: 'You have succefully added new comment'
    else
      render :new
    end
  end
end