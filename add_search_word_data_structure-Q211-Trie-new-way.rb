class TrieNode
  attr_accessor :kids, :tail

  def initialize
    @kids = []
    @tail = false
  end

  def search(chars)
    ch = chars[0]
    if chars.size == 1
      if ch == '.'
        @kids.map { |k| k && k.tail }.any?
      else
        node = @kids[ch.ord - 'a'.ord]
        return false unless node
        node.tail
      end
    else
      if ch == '.'
        @kids.each { |k| return true if k && k.search(chars[1..-1]) }
        false
      else
        node = @kids[ch.ord - 'a'.ord]
        return false unless node
        node.search(chars[1..-1])
      end
    end
  end
end

class WordDictionary
  def initialize()
    @root = TrieNode.new
    @max_len = 0
  end

  def add_word(word)
    node = @root
    word.each_char do |ch|
      node.kids[ch.ord - 'a'.ord] ||= TrieNode.new
      node = node.kids[ch.ord - 'a'.ord]
    end
    node.tail = true
    @max_len = [@max_len, word.length].max
  end

  def search(word)
    return false if word.size > @max_len
    @root.search(word.chars)
  end
end