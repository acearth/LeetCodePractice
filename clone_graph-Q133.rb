# Q-133: @note: definition is not good enough.
# Definition for a Node.
class Node
  attr_accessor :val, :neighbors

  def initialize(val = 0, neighbors = nil)
    @val = val
    neighbors = [] if neighbors.nil?
    @neighbors = neighbors
  end
end

# @param {Node} node
# @return {Node}
def cloneGraph(node)
  return unless node
  old, neo = {}, {}
  q = [node]
  while q.any?
    qq = []
    q.each do |n|
      next if old[n.val]
      old[n.val] ||= n
      neo[n.val] ||= Node.new(n.val)
      qq += n.neighbors
    end
    q = qq
  end
  old.values.each do |n|
    neo[n.val].neighbors = n.neighbors.map { |nb| neo[nb.val] }
  end
  neo[node.val]
end
