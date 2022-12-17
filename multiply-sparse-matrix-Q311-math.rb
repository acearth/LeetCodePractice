# Q-311: math sparse matrix computing
# 17/dec/2022
# @param {Integer[][]} mat1
# @param {Integer[][]} mat2
# @return {Integer[][]}
def multiply(mat1, mat2)
  horizontal_len = mat1.size
  vertical_len = mat2.first.size
  horizontal_zeroes = horizontal_len.times.map { |i| mat1[i].count(0) == mat1[0].size }
  vertical_zeroes = vertical_len.times.map { |j| mat2.size.times.map { |i| mat2[i][j] }.count(0) == mat2.first.size }
  matrix = horizontal_len.times.map { [0] * vertical_len }
  horizontal_len.times do |i|
    vertical_len.times do |j|
      next if horizontal_zeroes[i] || vertical_zeroes[j]
      matrix[i][j] = mat2.size.times.reduce(0) { |prod, k| mat1[i][k] * mat2[k][j] + prod }
    end
  end
  matrix
end