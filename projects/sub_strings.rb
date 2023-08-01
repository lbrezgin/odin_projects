#Project: Sub Strings

def substrings(string, dictionary)
  string_dictionary = string.downcase.split
  word_match = Array.new
  word_match_count = Array.new

  dictionary.each do |word|
    if string_dictionary.any? { |w| w.include?(word) }
      word_match << word
    end
    word_match_count << string_dictionary.count { |wor| wor.include?(word) }
    word_match_count.delete(0)
  end
  word_match.zip(word_match_count).to_h
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"] 
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
#=> { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
