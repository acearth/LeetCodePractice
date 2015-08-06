# a too slow solution. T(n)=n*n
def largest_number(nums)
  nums.each_with_index { |n, i| nums[i]=n.to_s }
  result=""
  while nums.size>0
    0.upto(nums.size-2) { |i| nums[i], nums[i+1]=nums[i+1], nums[i] if compare(nums[i], nums[i+1])>0 }
    result+=nums.pop
  end
  result.to_i.to_s ##mind '00' --> 0
end

def compare(a, b)
  base, longer=a, b
  base, longer=longer, base if a.size>b.size
  base.size.times { |i| t=a[i]<=>b[i]; return t if t!=0 }
  (a+b).to_i<=>(b+a).to_i
end

