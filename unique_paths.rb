# Q-62: unique path: raw DP
def unique_paths(m, n)
  methods = m.times.map { |_| [0] * n }
  m.times { |i| methods[i][0] = 1 }
  n.times { |i| methods[0][i] = 1 }
  (1...m).each do |i|
    (1...n).each do |j|
      methods[i][j] = methods[i - 1][j] + methods[i][j - 1]
    end
  end
  methods[-1][-1]
end