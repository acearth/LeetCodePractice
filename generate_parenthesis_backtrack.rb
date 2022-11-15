# Q-22:
#
# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  backtrack([], 0, 0, n, result = [])
  result

end

def backtrack(path, open, close, n, result)
  return result << path.join if open == close && close == n
  if open < n
    backtrack(path + ['('], open + 1, close, n, result)
  end

  if open > close
    backtrack(path + [')'], open, close + 1, n, result)
  end
end