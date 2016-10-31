def merge(nums1, m, nums2, n)
  (m + n - 1).downto(0) do |last|
    nums1[last] = if m == 0 || n > 0 && nums1[m - 1] < nums2[n - 1]
                    n -= 1; nums2[n]
                  else
                    m -= 1; nums1[m]
                  end
  end
  nums1
end
