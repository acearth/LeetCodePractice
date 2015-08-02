def first_missing_positive(nums)
  oldBase=0
  base=0
  rn=nums.reverse
  loop do
    nums.each { |e| base=e if e==base+1 }
    break if base==oldBase
    rn.each { |e| base=e if e==base+1 }
    break if base==oldBase
    oldBase=base
  end
  return base+1
end

a=[1, 2, 0]
p first_missing_positive(a)==3
a=[3, 4, -1, 1]
p first_missing_positive(a)==2
a=[1, 5, 4, 3, 2]
p first_missing_positive(a)==6
a=[1, 6, 4, 3, 2]
p first_missing_positive(a)==5

