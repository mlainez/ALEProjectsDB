class MyProjectsController < ApplicationController
  before_filter :require_user

  def index
    @projects = current_user.projects.all.paginate(:page => params[:page], :per_page => Project.per_page)
  end

  def destroy
    @project = current_user.projects.find(params[:id])
    if @project.destroy
      flash[:notice] = "Successfully deleted"
    else
      flash[:error] = "Could not delete that project"
    end
    redirect_to :action => :index
  end
end
