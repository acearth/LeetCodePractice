def partition(a, p, r)
  if p>=r
    return p
  end
  x=a[r]
  i=p-1
  for j in p..r-1 do
    if a[j]<=x
      i+=1
      a[i], a[j]=a[j], a[i]
    end
  end
  a[i+1], a[r]=a[r], a[i+1]
  return i+1
end


a=[3, 2, 1, 5, 6, 4]

def find_kth_largest(nums, k)
  loc=nums.size-k
  p=0
  r=nums.size-1
  while true
    q=partition(nums,p,r)
    if q==loc
      return nums[q]
    elsif q>loc
      r=q-1
    else
      p=q+1
    end
  end
end
