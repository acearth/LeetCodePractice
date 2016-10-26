# Assumed children range from 'a' to 'z'
class TrieNode
  attr_accessor :is_tail, :children

  def initialize
    @is_tail = false
    @children = []
  end
end

class Trie
  def initialize
    @root = TrieNode.new
  end

  def insert(word)
    cur = @root
    word.chars.each { |ch| cur = (cur.children[ch.ord - 'a'.ord] ||= TrieNode.new) }
    cur.is_tail = true
  end

  def search(word)
    cur = travel(word)
    cur && cur.is_tail
  end

  def starts_with(prefix)
    cur = travel(prefix)
    cur && true
  end

  def travel(word)
    cur = @root
    word.chars.each { |ch| (cur = cur.children[ch.ord-97]) || (return false) }
    cur
  end
end
