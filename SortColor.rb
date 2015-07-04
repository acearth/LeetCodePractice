def sort_colors(nums)
  k=[0,0,0]
  3.times do |i|
    for v in nums
    k[i]+=1 if v==i
    end
  end
  cul=0
  3.times do|i|
    k[i].times do |j|
      nums[cul+j]=i
    end
    cul+=k[i]
  end
  return
end

arr=[0,1,2,0,1,2]
#arr=[0]
sort_colors(arr)
p arr


