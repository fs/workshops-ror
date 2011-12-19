class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to :html
  before_filter :authenticate_user
  helper_method :signed_in?, :current_user

  private

  def authenticate_user
    if session[:user_id].nil?
      redirect_to new_session_path
    end
  end

  def signed_in?
    !session[:user_id].nil?
  end

  def current_user
    @user ||= if signed_in?
       User.find(session[:user_id])
    end
  end
end