# Should I exact matrix.size as a Constant ?
def rotate(matrix)
  (matrix.size/2 + matrix.size % 2).times do |j|
    (matrix.size/2).times do |i|
      cur = matrix[i][j]
      matrix[i][j] = matrix[matrix.size - 1-j][i]
      matrix[matrix.size - 1-j][i] = matrix[matrix.size - 1-i][matrix.size - 1-j]
      matrix[matrix.size - 1-i][matrix.size - 1-j] = matrix[j][matrix.size - 1-i]
      matrix[j][matrix.size - 1-i] = cur
    end
  end
end

