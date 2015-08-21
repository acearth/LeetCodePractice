def merge(nums1, m, nums2, n)
  i1, i2=m-1, n-1
  (m+n-1).downto(0) do |i|
    return if i2<0
    (nums1[0..i2]=nums2[0..i2]; return) if i1<0
    if nums1[i1]>nums2[i2]
      value=nums1[i1]
      i1-=1
    else
      value=nums2[i2]
      i2-=1
    end
    nums1[i]=value
  end
  return
end

merge([2,0], 1, [1], 1)
