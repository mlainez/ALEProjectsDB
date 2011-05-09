class ApplicationController < ActionController::Base
  protect_from_forgery  
  helper_method :current_user  

  def require_user
    if session[:user_id].blank?
      store_location
      redirect_to '/auth/linked_in'
      return false
    end
  end
  
  def store_location  
    session[:return_to] = request.fullpath  
  end  

  def redirect_back_or_default(default)  
    redirect_to(session[:return_to] || default)  
    session[:return_to] = nil  
  end

  private  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  
  end
end
