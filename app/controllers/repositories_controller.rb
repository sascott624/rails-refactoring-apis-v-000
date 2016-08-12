class RepositoriesController < ApplicationController
  def index
    # response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    # @repos_array = JSON.parse(response.body)
    repos = GithubService.new("access_token" => session[:token])
    @repos_array = repos.get_repos
  end

  def create
    # response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    repo = GithubService.new("access_token" => session[:token])
    repo.create_repo(params[:name])

    redirect_to '/'
  end
end
