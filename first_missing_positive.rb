# My idea is below:
# Basic solution: move step by step. In general case, the run time is close to O(n).
# But if the data is like killer adversary of Qsort, runtime complexity is O(n*n)
# Best run time: 76ms

def first_missing_positive(nums)
  oldBase, base,i=0,0,0
  arr=[nums,nums.reverse]
  loop do
    arr[i].each { |e| base=e if e==base+1 }
    return base+1 if base==oldBase # means can't increase
    oldBase,i=base,1-i
  end
end
#  A Theta(n) solution. Put positive to right position and check it.
#Best runtime: 76ms
def first_missing_positive_n(nums)
  nums.each do |n|
    while(1..nums.size).include?(n) && n!=nums[n-1]
      nums[n-1],n=n,nums[n-1]
    end
  end
  nums.each_with_index {|n,i| return i+1 if i+1!=n}
  nums.size+1
end
a=[1,2, 0]
p first_missing_positive(a)==3
a=[3, 4, -1, 1]
p first_missing_positive(a)==2
a=[1, 5, 4, 3, 2]
p first_missing_positive(a)==6
a=[1, 6, 4, 3, 2]
p first_missing_positive(a)==5

