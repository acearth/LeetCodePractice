# Q-36: validate a incomplete-able sudoku
def is_valid_sudoku_raw(board)
  9.times do |i|
    return false unless valid? board[i]
    return false unless valid? board.map { |line| line[i] }
  end
  3.times do |i|
    3.times do |j|
      zone = (i * 3...i * 3 + 3).map { |zi| board[zi][j * 3...j * 3 + 3] }.reduce(:+).sort
      return false unless valid? zone
    end
  end
  true
end

def valid?(tuple)
  pure = tuple - ['.']
  pure.size == pure.uniq.size
end

# from @StefanPochmann
def is_valid_sudoku(board)
  have = {}
  9.times do |i|
    9.times do |j|
      next if board[i][j] == '.'
      return false if have["seen #{board[i][j]} in line #{i}"]
      return false if have["seen #{board[i][j]} in column #{j}"]
      return false if have["seen #{board[i][j]} in zone #{i / 3}:#{j / 3}"]
      have["seen #{board[i][j]} in line #{i}"] = true
      have["seen #{board[i][j]} in column #{j}"] = true
      have["seen #{board[i][j]} in zone #{i / 3 }:#{j / 3 }"] = true
    end
  end
  true
end