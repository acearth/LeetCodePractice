# created on 23/jul/2015
def generate_matrix(n)
  return [] if n == 0
  a = [[]]
  k = n + 1
  (0..n - 1).each { |i| a[0][i] = i + 1 }
  (1..n - 1).each { |i| a[i] = []; a[i][n - 1] = k; k += 1 }
  (n - 2).downto(0).each { |i| a[n - 1][i] = k; k += 1 }
  si, ti, k, direction = n - 1, 0, k, 3
  while k <= n * n
    si, ti, k, direction = fixLine(a, si, ti, k, direction)
  end
  a
end

def fixLine(arr, si, ti, k, direction)
  step = direction > 1 ? -1 : 1
  ti += step if direction.even?
  si += step if direction.odd?
  while arr[si][ti] == nil
    arr[si][ti] = k
    k += 1
    ti += step if direction.even?
    si += step if direction.odd?
  end
  ti -= step if direction.even?
  si -= step if direction.odd?
  direction += 1
  direction = 0 if direction == 4
  return si, ti, k, direction
end

# Q-59: heuristic solution on 2/june/2022
# Since each sub-while is similar, can we create one uniform to deal with it?
def generate_matrix_heuristic(n)
  i, j, cur = 0, 0, 0
  matrix = n.times.map { |_| [0] * n }
  while cur < n * n
    # H-increase
    while matrix[i] && matrix[i][j] == 0
      cur += 1
      matrix[i][j] = cur
      j += 1
    end
    i, j = i + 1, j - 1
    # V-increase
    while matrix[i] && matrix[i][j] == 0
      cur += 1
      matrix[i][j] = cur
      i += 1
    end
    i, j = i - 1, j - 1
    #H-decrease
    while matrix[i] && matrix[i][j] == 0
      cur += 1
      matrix[i][j] = cur
      j -= 1
    end
    i, j = i - 1, j + 1
    #V-decrease
    while matrix[i] && matrix[i][j] == 0
      cur += 1
      matrix[i][j] = cur
      i -= 1
    end
    i, j = i + 1, j + 1
  end
  matrix
end

def generate_matrix_reduced(n)
  m, state = n.times.map { [0] * n }, -1
  i, j, k = 0, 0, 1
  move = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  adjust = [[1, -1], [-1, -1], [-1, 1], [1, 1]]
  while k <= n * n
    state = (state + 1) % 4
    while m[i] && m[i][j] == 0
      m[i][j] = k
      i, j, k = i + move[state][0], j + move[state][1], k + 1
    end
    i, j = i + adjust[state][0], j + adjust[state][1]
  end
  m
end