def generate_parenthesis(n)
  dfs(0, n * 2, '')
end

def dfs(balance, remain, produced)
  return [produced] if remain == 0 && balance == 0
  return [] if balance < 0 || remain < 1
  dfs(balance - 1, remain - 1, produced + ')') + dfs(balance + 1, remain - 1, produced + '(')
end
