def first_missing_positive(nums)
  oldBase, base,i=0,0,0  #initialize
  arr=[nums,nums.reverse]
  loop do
    arr[i].each { |e| base=e if e==base+1 }
    return base+1 if base==oldBase
    oldBase,i=base,1-i
  end
end

a=[1,2, 0]
p first_missing_positive(a)==3
a=[3, 4, -1, 1]
p first_missing_positive(a)==2
a=[1, 5, 4, 3, 2]
p first_missing_positive(a)==6
a=[1, 6, 4, 3, 2]
p first_missing_positive(a)==5

