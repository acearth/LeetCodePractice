#60ms on 9/oct/2021
def find_median_sorted_arrays(a,b)
  len=a.size+b.size
  return find_kth(a,b,len/2+1) if len.odd?
  (find_kth(a,b,len/2)+find_kth(a,b,len/2+1))*0.5
end
## k>0
def find_kth(a,b,k)
  return find_kth(b,a,k) if a.size<b.size  #ensure a.size >= b.size
  return a[k-1] if b.size==0
  return a[0]>b[0] ? b[0] : a[0] if k==1
  lenb=[b.size,k/2].min
  lena=k-lenb
  return find_kth(a[lena..-1],b,k-lena) if a[lena-1]<b[lenb-1]
  find_kth(a,b[lenb..-1],k-lenb)
end


# New solution 9/oct/2021, 68ms
def find_median_sorted_arrays(nums1, nums2)
    sorted=[]
    while nums1.first && nums2.first
        if nums1.first < nums2.first
            sorted << nums1.shift
        else
            sorted << nums2.shift
        end
    end
    sorted+= nums1 + nums2
    len=sorted.length
    if len.odd?
        sorted[len/2].to_f
    else
        (sorted[len/2]+ sorted[len/2 -1])/2.0
    end
end

# solution on 9/oct/2021, 68ms
def find_median_sorted_arrays(nums1, nums2)
    sorted=[]
    i,j=0,0
    len1, len2 = nums1.length, nums2.length
    while i < len1 && j < len2
        if nums1[i] > nums2[j]
            sorted << nums2[j]
            j+=1
        else
            sorted << nums1[i]
            i+=1
        end
    end
    sorted += nums1[i..len1] + nums2[j..len2]
    newlen=sorted.length
    if newlen.odd?
        sorted[newlen/2]
    else
        (sorted[newlen/2] + sorted[newlen/2 - 1])/2.0
    end
end


# Q-4: binary search heuristic way
# from HuaHua Youtube
# 14/dec/2022
# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  len1, len2 = nums1.size, nums2.size
  return find_median_sorted_arrays(nums2, nums1) if len2 < len1
  k = (len1 + len2 + 1) / 2
  l, r = 0, len1
  while l < r
    m = (l + r) / 2
    if nums1[m] < nums2[k - m - 1]
      l = m + 1
    else
      r = m
    end
  end
  k1 = [l == 0 ? -1 * 2 ** 32 : nums1[l - 1],
        k - l == 0 ? -1 * 2 ** 32 : nums2[k - l - 1]].max
  return k1 if (len1 + len2).odd?
  k2 = [l == len1 ? 2 ** 32 : nums1[l],
        k - l == len2 ? 2 ** 32 : nums2[k - l]].min
  (k1 + k2) / 2.0
end