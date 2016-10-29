def search_matrix(matrix, target)
  l, r = 0, matrix.length
  while l < r
    m = (l + r)/2
    if matrix[m].first > target
      r = m
    elsif matrix[m].first < target && matrix[m].last < target
      l = m + 1
    else
      return matrix[m].bsearch { |v| v >= target } == target
    end
  end
  false
end
