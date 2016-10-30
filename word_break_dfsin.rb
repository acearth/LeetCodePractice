def word_break(s, dict)
  return true if s == ''
  dict.each do |word|
    next unless word == s[0...word.size]
    return true if word_break(s[word.size..-1], dict)
    dict.delete(word)
  end
  false
end
