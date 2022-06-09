# Q-37: solve sudoku: backtracking: optimized on detail
def solve_sudoku(board)
  backtracking(board)
end

def backtracking(board)
  9.times do |i|
    9.times do |j|
      next if board[i][j] != '.'
      ('1'..'9').each do |k|
        next unless valid?(board, i, j, k)
        board[i][j] = k
        return true if backtracking(board)
        board[i][j] = '.'
      end
      return false
    end
  end
  true
end

def valid?(board, i, j, k)
  return false if board[i].include? k
  9.times { |i| return false if board[i][j] == k }
  (i / 3 * 3...i / 3 * 3 + 3).each do |zi|
    (j / 3 * 3...j / 3 * 3 + 3).each do |zj|
      return false if board[zi][zj] == k
    end
  end
  true
end