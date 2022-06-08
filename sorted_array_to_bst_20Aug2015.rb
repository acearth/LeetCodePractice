# Q-108: NOTE: iter-way easy to fail!
def sorted_array_to_bst(nums)
  return if nums.empty?
  mid = nums.size / 2
  TreeNode.new(nums[mid], sorted_array_to_bst(nums[0...mid]), sorted_array_to_bst(nums[mid + 1..]))
end

# TODO-retry
def sorted_array_to_bst(nums)
  root = TreeNode.new(0)
  ranges, q = [0...nums.size], [root]
  while q.any?
    cur, rg = q.shift, ranges.shift
    mid = rg.begin + (rg.end - rg.begin) / 2
    cur.val = nums[mid]
    if rg.begin < mid
      q << cur.left = TreeNode.new(0)
      ranges << (rg.begin...mid)
    end
    if mid + 1 < rg.end
      q << cur.right = TreeNode.new(0)
      ranges << (mid + 1...rg.end)
    end
  end
  root
end