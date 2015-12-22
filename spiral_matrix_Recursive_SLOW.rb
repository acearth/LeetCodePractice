def spiral_order(matrix)
  return matrix.flatten if matrix.size < 2 || matrix[0].size < 2
  result, stack = matrix.shift, []
  (matrix.size-1).times do |i|
    stack << matrix[i].shift
    result << matrix[i].pop
  end
  result + matrix.pop.reverse + stack.reverse + spiral_order(matrix)
end
