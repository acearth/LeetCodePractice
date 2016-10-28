def search(nums, target)
  rotate_search(nums, 0, nums.length, target)
end

def rotate_search(nums, l, r, target)
  return -1 if l == r
  return nums[l] == target ? l : -1 if l + 1 == r
  m = (l + r) / 2
  return m if target == nums[m]
  return rotate_search(nums, l, m, target) if m + 1 == r
  normal, rotated = nums[m] > nums[l] ? [[l, m], [m+1, r]] : [[m+1, r], [l, m]]
  unless target.between?(nums[normal.first], nums[normal.last - 1])
    return rotate_search(nums, rotated.first, rotated.last, target)
  end
  l, r = normal.first, normal.last
  while l < r
    m = (l + r) / 2
    return m if nums[m] == target
    target > nums[m] ? l = m + 1 : r = m
  end
  -1
end
