# Q-304
# 2/dec/2022
class NumMatrix

=begin
    :type matrix: Integer[][]
=end
  def initialize(matrix)
    @dp = (1 + matrix.size).times.map { [0] * (1 + matrix.first.size) }
    m, n = matrix.size, matrix.first.size
    m.times do |i|
      n.times do |j|
        @dp[i + 1][j + 1] = @dp[i + 1][j] + @dp[i][j + 1] - @dp[i][j] + matrix[i][j]
      end
    end
  end

=begin
    :type row1: Integer
    :type col1: Integer
    :type row2: Integer
    :type col2: Integer
    :rtype: Integer
=end
  def sum_region(row1, col1, row2, col2)
    @dp[row2 + 1][col2 + 1] - @dp[row1][col2 + 1] - @dp[row2 + 1][col1] + @dp[row1][col1]
  end
end

# Your NumMatrix object will be instantiated and called as such:
# obj = NumMatrix.new(matrix)
# param_1 = obj.sum_region(row1, col1, row2, col2)