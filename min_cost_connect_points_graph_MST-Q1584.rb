# Q-1584: graph MST
# 23/nov/2022
# @note: Kruskal way
#
# https://leetcode.com/problems/min-cost-to-connect-all-points/solution/
#  -- MST graph Prim method for Q-1584 (with Prim optimal solution)
# @param {Integer[][]} points
# @return {Integer}
def min_cost_connect_points(points)
  len = points.size
  edges = []
  len.times do |i|
    (i + 1...len).each do |j|
      edges << [points[i], points[j], distance(points[i], points[j])]
    end
  end
  edges = edges.sort_by(&:last)
  parents = Hash.new { |h, k| h[k] = k }
  result = 0
  step = 0
  while step < len - 1
    from, to, cost = edges.shift
    next unless union(from, to, parents)
    result += cost
    step += 1
  end
  result
end

def find(x, parent)
  parent[x] = find(parent[x], parent) if parent[x] != x
  parent[x]
end

def union(a, b, parent)
  x = find(a, parent)
  y = find(b, parent)
  return false if x == y
  parent[x] = y
  true
end

def distance(p1, p2)
  x = p1[0] - p2[0]
  y = p1[1] - p2[1]
  x.abs + y.abs
  # Math.sqrt(x * x + y * y)
end

p min_cost_connect_points([[3, 12], [-2, 5], [-4, 1]])
p min_cost_connect_points([[0, 0], [2, 2], [3, 10], [5, 2], [7, 0]])

# Prim implementation with aux array
# @param {Integer[][]} points
# @return {Integer}
def min_cost_connect_points(points)
  size = points.size
  have = {}
  min_distance = [2 ** 32] * size
  min_distance[0] = 0
  cost, used = 0, 0
  while used < size
    cur, distance = -1, 2 ** 32
    size.times do |i|
      next if have[i] || distance <= min_distance[i]
      cur = i
      distance = min_distance[i]
    end
    have[cur] = true
    cost += distance
    used += 1
    size.times do |i|
      next if have[i]
      min_distance[i] = [min_distance[i], mht(points[cur], points[i])].min
    end
  end
  cost
end

def mht(a, b)
  (a[0] - b[0]).abs + (a[1] - b[1]).abs
end

