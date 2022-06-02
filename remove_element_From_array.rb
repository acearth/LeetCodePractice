# Q-27: easy solution
def remove_element(nums, val)
  cleared = -1
  nums.each_with_index do |n, i|
    nums[cleared += 1] = n unless nums[i] == val
  end
  cleared + 1
end

# Better solution with less operations, cautions with pointers(border)!
def remove_element_directly(nums, val)
  p, q = 0, nums.size - 1
  while p <= q
    p += 1 while nums[p] != val && p < nums.size
    q -= 1 while nums[q] == val
    break if p > q || p == nums.size || q == -1
    nums[p], nums[q] = nums[q], nums[p]
  end
  p
end