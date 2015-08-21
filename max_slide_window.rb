def max_sliding_window(nums,k)
  curMax, result=[],[]
  nums.each_with_index do |n,i|
    curMax.delete_at(0) if curMax.size==k
    if curMax[0]!=nil && n>curMax[0]
      curMax=[n]
    else
      curMax<<n
    end
    result<<curMax[0] if i>=k-1
  end
  result
end
a=[1,3,-1,-3,5,3,6,7]
p max_sliding_window(a,3)
a=[1,3,1,2,0,5]
p max_sliding_window(a,3)

