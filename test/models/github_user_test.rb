require "test_helper"

class GithubUserTest < ActiveSupport::TestCase
  def github_user
    @github_user ||= GithubUser.new
  end

  def test_valid
    assert github_user.valid?
  end
end
