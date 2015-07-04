# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  return bsearch(nums,0,nums.length,target)

end
def bsearch(arr,l,h,target)
  m=(l+h)/2
  if target== arr[m]
    return m
  elsif target>arr[m]
    if m+1>=h
      return m+1
    else
      return bsearch(arr,m+1,h,target)
    end

  elsif target<arr[m]
    if m-1<l
      return l
      else
        return bsearch(arr,l,m,target)
    end

  elsif h-l==1 &&targe!=arr[l]
    return h
  elsif l-h==1 && target!=arr[h]
    return l
  end
end


a=Array.new
100.times do|i|
  a[i]=i*10
end

p search_insert(a,51)
p search_insert([1,3],2)
p search_insert([1],0)
