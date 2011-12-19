class DecisionsController < ApplicationController
  def index
    @decisions = if params[:filter] == 'my'
      current_user.decisions
    else
      Decision.all
    end
  end

  def show
    @decision = Decision.find(params[:id])
  end

  def new
    @decision = Decision.new
  end

  def edit
    @decision = current_user.decisions.find(params[:id])
  end

  def create
    @decision = current_user.decisions.build(params[:decision])

    if @decision.save
      redirect_to @decision, notice: 'Decision was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @decision = current_user.decisions.find(params[:id])

    if @decision.update_attributes(params[:decision])
      redirect_to @decision, notice: 'Decision was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @decision = current_user.decisions.find(params[:id])
    @decision.destroy
    redirect_to decisions_url
  end

end
