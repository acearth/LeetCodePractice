# Q-323: graph connected component count
# 23/nov/2022
#
# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}
def count_components(n, edges)
  parents = n.times.map { |i| [i, i] }.to_h
  size = n
  edges.each { |from, to| size -= 1 if union(from, to, parents) }
  size
end

def find(x, parent)
  parent[x] = find(parent[x], parent) if parent[x] != x
  parent[x]
end

def union(x, y, parent)
  p, q = find(x, parent), find(y, parent)
  return false if p == q
  parent[p] = q
  true
end
