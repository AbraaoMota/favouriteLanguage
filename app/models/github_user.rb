class GithubUser < ActiveRecord::Base
  serialize :favourite_language

  attr_reader :language_count

  def calculate_favourite_language(repos)
    languages = repos.map(&:language)
    language_count_hash = create_language_hash(languages)
    @language_count = language_count_hash
    most_used = most_used_languages(language_count_hash.dup)
    self.favourite_language = most_used
    save
    favourite_language
  end

  private

  def create_language_hash(languages)
    languages = modify_nils(languages)
    languages.inject(Hash.new(0)) do |lang, count|
      lang.update(count => lang[count] + 1)
    end
  end

  def modify_nils(languages)
    languages.each_with_index do |lang, index|
      if lang.nil?
        languages.delete_at(index)
        languages.append('Unknown')
      end
    end
  end

  def most_used_languages(language_count)
    most_used = language_count.keep_if do |_lang, count|
      count == language_count.values.max
    end
    most_used.keys
  end
end
