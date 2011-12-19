class CommentsController < ApplicationController
  def create
    decision = Decision.find(params[:decision_id])
    comment = decision.comments.build(params[:comment])
    comment.user = current_user
    
    if comment.save
      notice = 'You have succefully added new comment'
    else
      notice = 'Coment was not created'
    end
    redirect_to decision, notice: notice
  end
end