# Q-397: DP top down
# 16/dec/2022
# @param {Integer} n
# @return {Integer}
def integer_replacement(n)
  dp(n, { 1 => 0 })
end

def dp(n, dict)
  return dict[n] if dict[n]
  if n.even?
    dict[n] = 1 + dp(n / 2, dict)
  else
    dict[n] = [dp((n + 1) / 2, dict) + 1, dp(n - 1, dict)].min + 1
  end
end

