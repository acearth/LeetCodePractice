def calculate_minimum_hp(dungeon)
  state = [(2 ** 32)] * (dungeon[0].size + 1)
  state[dungeon[0].size - 1] = 1 #if you set state[-1]=1,  error occurs in next new loop
  (dungeon.size - 1).downto(0) do |i|
    (dungeon[0].size - 1).downto(0) do |j|
      state[j] = [1, [state[j], state[j + 1]].min - dungeon[i][j]].max
    end
  end
  state[0]
end

a = [[-2, -3, 3],
     [-5, -10, 1],
     [10, 30, -5]]
p calculate_minimum_hp(a)

# Q-174: solution in 17/nov/2022
def calculate_minimum_hp(dungeon)
  m, n = dungeon.size, dungeon.first.size
  dp = (1 + m).times.map { [2 ** 32] * (1 + n) }
  dp[-1][-2] = 1
  (m - 1).downto(0) do |i|
    (n - 1).downto(0) do |j|
      dp[i][j] = [1, [dp[i + 1][j], dp[i][j + 1]].min - dungeon[i][j]].max
    end
  end
  pp dp
  p dp.first.first
end

p calculate_minimum_hp(dungeon = [[-2, -3, 3], [-5, -10, 1], [10, 30, -5]])
