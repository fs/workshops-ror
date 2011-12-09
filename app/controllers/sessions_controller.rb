class SessionsController < ApplicationController
  respond_to :html
  before_filter :check_signed_in_user, only: [:new, :create]

  def new
  end

  def create
    @user = User.where(email: params[:email]).first

    unless @user.nil?
      session[:user_id] = @user.id
      flash[:notice] = 'You successfully signed in'
      redirect_to root_path
    else
      flash[:notice] = 'Email is incorrect'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end

  private
  
  def check_signed_in_user
    if session[:user_id]
      redirect_to root_path
    end
  end
end
