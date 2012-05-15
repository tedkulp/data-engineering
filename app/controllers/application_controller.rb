class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :user_signed_in?

  private

  def user_signed_in?
    !session[:user_id].nil?
  end

  def logged_in?
    user_signed_in?
  end

  def login_required
    !logged_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    User.current_user = @current_user
    @current_user
  end

  def current_user=(user)
    @current_user = user
    @current_user
  end

  def authenticate!
    unless user_signed_in?
      store_location
      redirect_to '/auth/open_id'
    end
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def stored_location
    session[:return_to]
  end

  def clear_stored_location
    session[:return_to] = nil
  end
end
