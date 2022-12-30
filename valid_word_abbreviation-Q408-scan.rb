# Q-408: scan easy
# 31/dec/2022
# @param {String} word
# @param {String} abbr
# @return {Boolean}
def valid_word_abbreviation(word, abbr)
  start = 0
  abbr.scan(/\d+|[a-z]/).each do |token|
    if token =~ /\d+/
      start += token.to_i
      return false if token[0] == '0'
    else
      return false unless word[start...start + token.size] == token
      start += token.size
    end
  end
  start == word.size
end