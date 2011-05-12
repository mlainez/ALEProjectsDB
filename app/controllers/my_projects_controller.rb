class MyProjectsController < ApplicationController
  before_filter :require_user

  def index
    @projects = current_user.projects.all.paginate(:page => params[:page], :per_page => Project.per_page)
  end
end