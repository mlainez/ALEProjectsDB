class AuthFailuresController < ApplicationController
  def new
    flash[:error] = "Authentication failure"
    redirect_to root_path
  end
end
