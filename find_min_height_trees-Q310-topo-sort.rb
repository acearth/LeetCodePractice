# Q-310: topological sort
#
# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[]}

require 'set'

# by edge and set
def find_min_height_trees(n, edges)
  adjs = Hash.new { |h, k| h[k] = Set.new }
  edges.each { |a, b| adjs[a] << b; adjs[b] << a }
  remained = n
  leaves = adjs.keys.select { |v| adjs[v].size == 1 }
  while remained > 2
    newleaves = []
    leaves.each do |v|
      adjs[v].each { |to| adjs[to].delete(v) }
      newleaves += adjs[v].select { |to| adjs[to].size == 1 }
    end
    remained -= leaves.size
    leaves = newleaves
  end
  leaves.any? ? leaves : [0]
end

# by degree and edge
def find_min_height_trees(n, edges)
  degrees = n.times.map { |i| [i, 0] }.to_h
  adjs = Hash.new { |h, k| h[k] = [] }
  edges.each do |a, b|
    adjs[a] << b
    adjs[b] << a
    degrees[a] += 1
    degrees[b] += 1
  end
  remained = n
  leaves = degrees.keys.select { |v| degrees[v] == 1 }
  while remained > 2
    new_leaves = []
    leaves.each do |v|
      adjs[v].each { |to| degrees[to] -= 1 }
      degrees[v] = -1 # mark as removed
      new_leaves += adjs[v].select { |to| degrees[to] == 1 }
    end
    remained -= leaves.size
    leaves = new_leaves
  end
  leaves.empty? ? 0 : leaves
end

p find_min_height_trees(6, [[0, 1], [0, 2], [0, 3], [3, 4], [4, 5]])
p find_min_height_trees(4, [[1, 0], [1, 2], [1, 3]])
p find_min_height_trees(6, [[3, 0], [3, 1], [3, 2], [3, 4], [5, 4]])
p find_min_height_trees(1, [])

p find_min_height_trees(6, [[0, 1], [0, 2], [0, 3], [3, 4], [4, 5]])
p find_min_height_trees(4, [[1, 0], [1, 2], [1, 3]])
p find_min_height_trees(6, [[3, 0], [3, 1], [3, 2], [3, 4], [5, 4]])
p find_min_height_trees(1, [])

