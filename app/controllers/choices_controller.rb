class ChoicesController < ApplicationController
  before_filter :set_decision
  before_filter :set_choice

  respond_to :html

  def new
    respond_with :choice
  end

  def edit
    respond_with :choice
  end

  def create
    if @choice.save
      redirect_to @decision, notice: 'Choice was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @choice.update_attributes(params[:choice])
      redirect_to @decision, notice: 'Choice was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @choice.destroy
    redirect_to @decision
  end

  private

  def set_decision
    @decision = Decision.find(params[:decision_id])
  end

  def set_choice
    @choice = if params[:id]
      @decision.choices.find(params[:id])
    else
      @decision.choices.build(params[:choice])
    end
  end
end
