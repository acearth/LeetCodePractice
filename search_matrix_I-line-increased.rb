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

# Q-74: note: matrix[i] < matrix[i+1] on each element matrix[i][j] (diff with Q-240)
def search_matrix(matrix, target)
  up, down = 0, matrix.size
  while up < down
    m = (up + down) / 2
    left, right = 0, matrix[0].size
    while left < right
      k = (left+right)/2
      return true if matrix[m][k]==target
      if matrix[m][k] > target
        right=k
      else
        left=k+1
      end
    end
    if matrix[m][0] > target
      down = m
    else
      up = m + 1
    end
  end
  false
end