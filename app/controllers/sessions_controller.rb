class SessionsController < ApplicationController
  skip_before_filter :authenticate_user
  before_filter :check_signed_in_user, only: [:new, :create]

  def new
  end

  def create
    @user = User.where(email: params[:email]).first

    unless @user.nil?
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'You successfully signed in'
    else
      flash[:notice] = 'Email is incorrect'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: 'You have successfully signed out'
  end

  private

  def check_signed_in_user
    redirect_to root_path if signed_in?
  end
end
