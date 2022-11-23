# Q-1135: Minimium Spanning Tree by Kruskal algo.
# 23/nov/2022
#
# @param {Integer} n
# @param {Integer[][]} connections
# @return {Integer}
require 'set'

def minimum_cost(n, connections)
  parents = Hash.new { |h, k| h[k] = k }
  edges = connections.sort_by(&:last)
  result = 0
  step = 0
  while edges.any?
    from, to, cost = edges.shift
    next unless union(from, to, parents)
    result += cost
    step += 1
  end
  step == n - 1 ? result : -1
end

def find(parent, x)
  parent[x] = find(parent, parent[x]) if parent[x] != x
  parent[x]
end

def union(p, q, parent)
  x, y = find(parent, p), find(parent, q)
  return false if x == y
  parent[x] = y
  true
end
