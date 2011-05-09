class ProjectsController < ApplicationController
  before_filter :require_user, :except => [:index]
  before_filter :find_project, :only   => [:edit, :update]
  
  def index
    @projects = Project.all
  end
  
  def new
  end
  
  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = "The project was saved successfully"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def edit
  end
  
  def update
    @project.attributes = params[:project]
    if @project.save
      flash[:notice] = "Project updated successfully"
      redirect_to :action => :index
    else
      flash[:error] = "The changes could not be saved"
      render :action => :edit
    end
  end
  
  private
  def find_project
    @project = current_user.projects.find(params[:id])
  end
end