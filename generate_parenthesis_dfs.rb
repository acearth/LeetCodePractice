def generate_parenthesis(n)
  dfs(0, n * 2, '')
end

def dfs(state, resource, have)
  return [have] if resource == 0 && state == 0
  return [] if state < 0 || resource < 1
  dfs(state - 1, resource - 1, have + ')') + dfs(state + 1, resource - 1, have + '(')
end
