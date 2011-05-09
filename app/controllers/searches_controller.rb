class SearchesController < ApplicationController
  def index
    @projects = Project.search(params["search-field"])
  end
end