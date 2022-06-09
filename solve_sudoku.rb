# Q-37: solve sudoku by backtracking
# frozen_string_literal: true

def solve_sudoku(board)
  backtracking(board)
end

def backtracking(board)
  9.times do |i|
    9.times do |j|
      next if board[i][j] != '.' # @note: avoid returns
      possible(board, i, j).each do |put|
        board[i][j] = put
        return true if backtracking(board)
        board[i][j] = '.'
      end
      return false
    end
  end
  true
end

def possible(board, i, j)
  return [] if board[i][j] != '.'

  avail = ('1'..'9').to_a - board[i] - board.map { |line| line[j] }
  zi = i / 3 * 3
  zj = j / 3 * 3
  (zi...zi + 3).each do |line|
    (zj...zj + 3).each do |col|
      avail -= [board[line][col]]
    end
  end
  avail
end