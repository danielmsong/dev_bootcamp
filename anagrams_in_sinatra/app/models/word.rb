class Word < ActiveRecord::Base
  
  def self.anagrams(word)
    Word.where("anagram = ?", canonical(word))
  end

  def self.canonical(word)
    word.downcase.split("").sort.join
  end

end
