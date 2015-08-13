# two way to implements
# 1. the way of merge, t(n)=o(k)
# 2. divide and conquer, t(n)=o(logk)
# Redo those again!
def findKth(nums1,nums2,k)
end
    
def find_median_sorted_arrays(nums1,nums2)
  return findKth(nums1,nums2,(nums1.size+nums2.size+1)/2) if (nums1.size+nums2.size).odd?
  (findKth(nums1,nums2,(nums1.size+nums2.size)/2)+(findKth(nums1,nums2,(nums1.size+nums2.size)/2+1)))*0.5
end
a=[]
b=[2,3]
p find_median_sorted_arrays(a,b)
a=[1,2,3]
b=[2,3,4,5]
p find_median_sorted_arrays(a,b)
