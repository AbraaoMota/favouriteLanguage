class GithubUsersController < ApplicationController
  def show
    user_name = params["name"]
    user = find_or_create_user_by_name(user_name)

    repo_list = github.repos.list user: user_name

    languages = user.calculate_favourite_language(repo_list)

    render :index, locals: { repos: repo_list, user: user, language: languages }
  end

  private

  def find_or_create_user_by_name(name)
    @user ||= GithubUser.find_or_create_by(name: name)
  end

  def github
    @github ||= Github.new
  end
end
