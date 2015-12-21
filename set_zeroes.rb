def set_zeroes(matrix)
  rows, cols = matrix.size, matrix[0].size
  zero_rows = matrix.map { |line| line.include? 0 }
  cols.times do |c|
    rows.times { |l| matrix[l][c] = 0 } if zero_column?(matrix, rows, c)
  end
  rows.times { |l| matrix[l] = [0] * cols if zero_rows[l] }
end

def zero_column?(matrix, rows, col)
  rows.times { |l| return true if matrix[l][col] == 0 }
  false
end
