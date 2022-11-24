# Q-743: graph dijkstra
# 24/nov/2022
#
# @param {Integer[][]} times
# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def network_delay_time(times, n, k)
  adjs = Hash.new { |h, k| h[k] = [] }
  times.each { |from, to, cost| adjs[from] << [to, cost] }
  signal = [2 ** 32] * (1 + n)
  dijkstra(adjs, signal, n, k)
  signal[0] = -1
  signal.max == 2 ** 32 ? -1 : signal.max
end

def dijkstra(adjs, signal, n, k)
  have = [false] * (1 + n)
  signal[k] = 0
  step = 0
  while step < n
    cur = -1
    cur_time = 2 ** 32
    (1..n).each do |i|
      next if have[i] || cur_time <= signal[i]
      cur_time = signal[i]
      cur = i
    end
    return if cur == -1
    have[cur] = true
    step += 1
    adjs[cur].each do |to, cost|
      next if have[to] || signal[to] <= cost + cur_time
      signal[to] = cost + cur_time
    end
  end
end

# p network_delay_time(times = [[2, 1, 1], [2, 3, 1], [3, 4, 1]], n = 4, k = 2)
