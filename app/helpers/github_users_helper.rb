module GithubUsersHelper
  def favourite_language_formatter(name, langs)
    case langs.size
    when 0
      "#{name} hasn't done any work! Tell them to make a Pull Request!"
    when 1
      "#{name}'s favourite language is #{langs.first}!"
    when 2
      "#{name}'s favourite languages are #{langs[0]} and #{langs[1]}!"
    else
      "#{name} equally likes #{langs.to_sentence}"
    end
  end
end
