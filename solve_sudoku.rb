# Q-37: solve sodoku by better backtracking
def solve_sudoku(board)
  backtrack(board, 0)
end

def backtrack(board, seq)
  return true if seq == 81
  i, j = seq / 9, seq % 9
  return backtrack(board, seq + 1) if board[i][j] != '.'
  ('1'..'9').each do |ch|
    if available?(board, i, j, ch)
      board[i][j] = ch
      return true if backtrack(board, seq + 1)
      board[i][j] = '.'
    end
  end
  false
end

def available?(board, i, j, c)
  return false if board[i].include?(c)
  return false if 9.times.map { |k| board[k][j] }.include?(c)
  3.times do |zi|
    3.times do |zj|
      cur_i = (i / 3) * 3 + zi
      cur_j = (j / 3) * 3 + zj
      return false if board[cur_i][cur_j] == c
    end
  end
  true
end
