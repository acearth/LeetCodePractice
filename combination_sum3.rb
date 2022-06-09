# Q-216: comb sum 3: backtracking
def combination_sum3(k, n)
  result = []
  backtracking(1, n, [], k, result)
  result
end

def backtracking(start, n, sums, remain, result)
  return (result << [] + sums if sums.sum == n) if remain == 0
  (start..9 - remain + 1).each do |i|
    sums << i
    backtracking(i + 1, n, sums, remain - 1, result)
    sums.pop
  end
end