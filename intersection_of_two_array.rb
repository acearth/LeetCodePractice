# q-349: two array intersection
def intersection(nums1, nums2)
  has = {}
  nums1.each { |n| has[n] = true }
  joined = []
  nums2.select do |n|
    has[n]
  end
  nums2.each { |n| (joined << n; has[n] = false) if has[n] }
  joined
end
