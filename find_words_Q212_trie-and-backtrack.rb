# Q-212: Trie with backtrack
# 28/dec/2022
# @param {Character[][]} board
# @param {String[]} words
# @return {String[]}
class TrieNode
  attr_accessor :word, :kids

  def initialize
    @word = nil
    @kids = []
  end
end

def find_words(board, words)
  root = TrieNode.new
  words.each do |word|
    node = root
    word.each_char do |ch|
      node.kids[ch.ord - 'a'.ord] ||= TrieNode.new
      node = node.kids[ch.ord - 'a'.ord]
    end
    node.word = word
  end
  @result = []
  @dirs = [[-1, 0], [1, 0], [0, -1], [0, 1]]
  board.size.times do |i|
    board.first.size.times do |j|
      next unless root.kids[board[i][j].ord - 'a'.ord]
      backtrack(board, i, j, root)
    end
  end
  @result
end

def backtrack(board, i, j, parent)
  ch = board[i][j]
  curr = parent.kids[ch.ord - 'a'.ord]
  return unless curr
  if curr.word
    @result << curr.word
    curr.word = nil
  end
  board[i][j] = '#'
  @dirs.each do |di, dj|
    next if i + di < 0 || i + di >= board.size || j + dj < 0 || j + dj >= board.first.size
    backtrack(board, i + di, j + dj, curr)
  end
  board[i][j] = ch
  parent.kids[ch.ord - 'a'.ord] = nil unless curr.kids.any?
end
