class MyProjectsController < ApplicationController
  before_filter :require_user

  def index
    @projects = current_user.projects
  end
end