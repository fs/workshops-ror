class ChoicesController < ApplicationController
  def new
    choice
  end

  def edit
    choice
  end

  def create
    if choice.save
      redirect_to decision, notice: 'Choice was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if choice.update_attributes(params[:choice])
      redirect_to decision, notice: 'Choice was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    choice.destroy
    redirect_to decision
  end

  private

  def decision
    @decision ||= current_user.decisions.find(params[:decision_id])
  end

  def choice
    @choice ||= if params[:id]
      decision.choices.find(params[:id])
    else
      decision.choices.build(params[:choice])
    end
  end
end
