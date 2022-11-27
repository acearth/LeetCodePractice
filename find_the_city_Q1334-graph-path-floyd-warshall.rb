# Q-1334: graph shortest parh: Floyd-Warshall
# 27/nov/2022
# NOTE: (1) k must be outer of i, j loops
#       (2) cost[i][i] = 0, have to set;
# @param {Integer} n
# @param {Integer[][]} edges
# @param {Integer} distance_threshold
# @return {Integer}
def find_the_city(n, edges, distance_threshold)
  me = n.times.map { [2 ** 32] * n }
  edges.each { |from, to, cost| me[from][to] = me[to][from] = cost }
  n.times do |k|
    me[k][k] = 0
    n.times do |i|
      n.times do |j|
        me[i][j] = [me[i][j], me[i][k] + me[k][j]].min
      end
    end
  end
  min, last = 2 ** 32, -1
  n.times do |i|
    cur = me[i].select { |cost| cost <= distance_threshold }.count
    min, last = cur, i if cur <= min
  end
  last
end