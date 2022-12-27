# Q-211: design trie
# only run successful once in 2800 ms others are TLE
# Speedup policy:
# - return false if longer than current max size;
# - cache 10000 items result;
class Node
  attr_accessor :tail, :kids

  def initialize()
    @tail = false
    @kids = [nil] * 26
  end

  def add_word(word)
    return unless word.size > 0
    ord = word[0].ord - 'a'.ord
    if word.size == 1
      @kids[ord] ||= Node.new
      @kids[ord].tail = true
    else
      @kids[ord] ||= Node.new
      @kids[ord].add_word(word[1..-1])
    end
  end

  def search(word)
    return false unless word.size > 0
    if word[0] == '.'
      if word.size == 1
        26.times do |i|
          return true if @kids[i] && @kids[i].tail
        end
        false
      else
        26.times do |i|
          return true if @kids[i] && @kids[i].search(word[1..-1])
        end
        false
      end
    end
    ord = word[0].ord - 'a'.ord
    if word.size == 1
      return false unless @kids[ord]
      @kids[ord].tail
    else
      return false unless @kids[ord]
      @kids[ord].search(word[1..-1])
    end
  end
end

class WordDictionary

  def initialize()
    @root = Node.new
  end

=begin
    :type word: String
    :rtype: Void
=end
  def add_word(word)
    @root.add_word(word)
  end

=begin
    :type word: String
    :rtype: Boolean
=end
  def search(word)
    @root.search(word)
  end

end

# Your WordDictionary object will be instantiated and called as such:
# obj = WordDictionary.new()
# obj.add_word(word)
# param_2 = obj.search(word)
