# Q-52: N-queens: formed backtracking solution
def total_n_queens(n)
  backtracking(n, 0, [], @result = 0)
  @result
end

def backtracking(n, level, placed, result)
  return @result += 1 if level == n

  n.times.each do |j|
    next unless placeable?(placed, level, j)

    placed << j
    backtracking(n, level + 1, placed, result)
    placed.pop
  end
end

# @note: Given place is (i,j), how about the 0-th line? it shall be (0,j-i)
#        The 1-st line shall be (1,j-i+1), the X-th line shall be (j-i+X).
def placeable?(placed, i, j)
  i.times do |cur|
    return false if placed[cur] == j - cur + i || placed[cur] == j + cur - i || placed[cur] == j
  end
  true
end
