class SessionsController < ApplicationController
  def create
    @user = User.find_by_auth_hash(auth_hash) || User.create_with_auth_hash(auth_hash)  
    session[:user_id] = @user.id
    flash[:notice] = "Signed in!"
    redirect_back_or_default root_url
  end
  
  def destroy  
    session[:user_id] = nil  
    redirect_to root_url, :notice => "Signed out!"  
  end
  
  private
  def auth_hash
    request.env["omniauth.auth"]
  end 
end