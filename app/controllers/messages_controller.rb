class MessagesController < ApplicationController
  before_filter :authenticate_user
  before_filter :set_decision
  respond_to :html

  def create
    if @decision.messages.create(params[:message].merge(:user => current_user))
      flash[:notice] = 'You have succefully added new comment'
    end
    redirect_to @decision
  end

  private

  def set_decision
    @decision = Decision.find(params[:decision_id])
  end
end
