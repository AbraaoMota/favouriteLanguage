require 'test_helper'
require 'ostruct'

class GithubUserTest < ActiveSupport::TestCase
  def github_user
    @github_user ||= GithubUser.new
  end

  def test_calculate_favourite_language_returns_highest_count
    assert github_user.calculate_favourite_language(repos_fixture) == ['Python']
  end

  private

  def repos_fixture
    repo1 = OpenStruct.new(name: 'TopSecretWork', language: 'Python')
    repo2 = OpenStruct.new(name: 'VerySeriousC', language: 'C++')
    repo3 = OpenStruct.new(name: 'Object Oriented Design', language: 'Python')
    [repo1, repo2, repo3]
  end
end
