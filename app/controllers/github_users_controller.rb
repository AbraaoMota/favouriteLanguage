class GithubUsersController < ApplicationController
  def show
    if gh_user?
      user = find_or_create_user_by_name(user_name)
      user.calculate_favourite_language(repo_list)
      render :index, locals: { repos: repo_list, user: user }
    else
      flash[:error] = "That user doesn't exist in Github!"
      redirect_to index_path
    end
  end

  private

  def gh_user?
    gh_user = github.search.users(user_name)
    !gh_user.items.empty?
  end

  def repo_list
    @repo_list ||= github.repos.list(user: user_name)
  end

  def user_name
    @user_name ||= params['name'].downcase
  end

  def find_or_create_user_by_name(name)
    @user ||= GithubUser.find_or_create_by(name: name)
  end

  def github
    @github ||= Github.new
  end
end
