# Q-1136: graph topo sort: peeling onion
# @param {Integer} n
# @param {Integer[][]} relations
# @return {Integer}
def minimum_semesters(n, relations)
  ins = (1..n).map { |i| [i, 0] }.to_h
  adjs = Hash.new { |h, k| h[k] = [] }
  relations.each do |from, to|
    adjs[from] << to
    ins[to] += 1
  end
  leaves = ins.keys.select { |k| ins[k] == 0 }
  count = 0
  while leaves.any?
    new_leaves = []
    leaves.each do |cur|
      adjs[cur].each do |to|
        ins[to] -= 1
        new_leaves << to if ins[to] == 0
      end
    end
    leaves = new_leaves
    count += 1
  end
  ins.values.select { |d| d > 0 }.any? ? -1 : count
end