class SessionsController < ApplicationController
  def create
    @user = User.from_omniauth(auth_hash)
    session[:user_id] = @user.id
    self.current_user = @user
    redirect_to '/', :notice => 'Signed in!'
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', :notice => 'Signed out!'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
