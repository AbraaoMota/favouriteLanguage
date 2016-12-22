require 'test_helper'

class GithubUsersHelperTest < ActionView::TestCase
  def test_formatter_returns_one_language
    name = 'Bob'
    langs = ['Scala']
    returned = favourite_language_formatter(name, langs)
    assert returned == "Bob's favourite language is Scala!"
  end

  def test_formatter_returns_two_languages
    name = 'Steven'
    langs = %w(Python Ruby)
    returned = favourite_language_formatter(name, langs)
    assert returned == "Steven's favourite languages are Python and Ruby!"
  end

  def test_formatter_returns_no_work
    name = 'Billy'
    langs = []
    returned = favourite_language_formatter(name, langs)
    assert returned == "Billy hasn't done any work! " \
                       'Tell them to make a Pull Request!'
  end

  def test_formatter_returns_multiple_favourites
    name = 'Abe'
    langs = %w(Java Ruby Python C)
    returned = favourite_language_formatter(name, langs)
    assert returned == 'Abe equally likes Java, Ruby, Python, and C'
  end
end
