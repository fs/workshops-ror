class VotesController < ApplicationController
  before_filter :authenticate_user

  def create
    decision = Decision.find(params[:decision_id])
    choice = decision.choices.find(params[:choice_id])
    if decision.user_voted?(current_user)
      flash[:notice] = 'You have already voted for this decision'
    else
      choice.vote!(current_user)
      flash[:notice] = 'You have successfully voted for decision'
    end
    redirect_to decision_path(decision)
  end
end
