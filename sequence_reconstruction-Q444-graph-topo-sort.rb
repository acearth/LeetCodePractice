# Q-444 graph: topo sort
# 23/nov/2022
#
# @param {Integer[]} nums
# @param {Integer[][]} sequences
# @return {Boolean}
def sequence_reconstruction(nums, sequences)
  adjs = Hash.new { |h, k| h[k] = [] }
  ins = nums.map { |n| [n, 0] }.to_h
  sequences.each do |seq|
    (0...seq.size - 1).each do |i|
      from, to = seq[i], seq[i + 1]
      adjs[from] << to
      ins[to] += 1
    end
  end
  result = []
  head, _ = ins.find { |_, v| v == 0 }
  candidates = [head]
  while candidates.any?
    head = candidates.first
    result << head
    candidates = []
    adjs[head].each do |vertice|
      ins[vertice] -= 1
      candidates << vertice if ins[vertice] == 0
    end
    return false if candidates.size > 1
  end
  result.sort == nums.sort
end

p sequence_reconstruction(nums = [1, 2, 3], sequences = [[1, 2], [1, 3]]) == false
p sequence_reconstruction(nums = [1, 2, 3], sequences = [[1, 2]]) == false
p sequence_reconstruction(nums = [1, 2, 3], sequences = [[1, 2], [1, 3], [2, 3]])
