class SearchesController < ApplicationController
  def index
    @projects = Project.search(params["search-field"]).paginate(:page => params[:page], :per_page => Project.per_page)
  end
end