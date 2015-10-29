def merge(nums1, m, nums2, n)
  m,n=m-1,n-1
  while m>-1
    return if n < 0
    if nums1[m] > nums2[n]
      nums1[m+n+1]=nums1[m]
      m-=1
    else
      nums1[m+n+1]=nums2[n]
      n-=1
    end
  end
(nums1[n] = nums2[n]; n-=1)  while n>-1 # deal with remain2
end
