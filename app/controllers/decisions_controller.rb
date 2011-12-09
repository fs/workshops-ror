class DecisionsController < ApplicationController
  before_filter :authenticate_user

  def index
    @decisions = Decision.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @decisions }
    end
  end

  def show
    @decision = Decision.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @decision }
    end
  end

  def new
    @decision = Decision.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @decision }
    end
  end

  def edit
    @decision = Decision.find(params[:id])
  end

  def create
    @decision = Decision.new(params[:decision])

    respond_to do |format|
      if @decision.save
        format.html { redirect_to @decision, notice: 'Decision was successfully created.' }
        format.json { render json: @decision, status: :created, location: @decision }
      else
        format.html { render action: "new" }
        format.json { render json: @decision.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @decision = Decision.find(params[:id])

    respond_to do |format|
      if @decision.update_attributes(params[:decision])
        format.html { redirect_to @decision, notice: 'Decision was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @decision.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @decision = Decision.find(params[:id])
    @decision.destroy

    respond_to do |format|
      format.html { redirect_to decisions_url }
      format.json { head :ok }
    end
  end
end
