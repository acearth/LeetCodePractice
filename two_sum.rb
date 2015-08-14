def two_sum(nums,target)
  hash=Hash.new
  nums.each_with_index{|n,i| hash[target-n]=[n,i+1]}
  nums.each_with_index{|n,i| return [i+1,hash[n][1]] if hash[n]!=nil&&i+1!=hash[n][1] }
end
a=[1,2,7,11,15]
p two_sum(a,9)
