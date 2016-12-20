class GithubUser < ActiveRecord::Base

  def calculate_favourite_language(repos)
    languages = repos.map { |repo| repo.language }
    language_hash_count = languages.inject(Hash.new(0)) { |lang, count| lang.update(count => lang[count] + 1 ) }
    most_used = language_hash_count.keep_if { |lang, count| count == language_hash_count.values.max }
    languages = most_used.keys
  end
end
