class RepositoriesController < ApplicationController
  def index
    service = GithubService.new
    service.search_repositories_from_languages

    @repositories = Repository.all
  end

  def show
    @repository = Repository.find(params[:format])
  end
end
