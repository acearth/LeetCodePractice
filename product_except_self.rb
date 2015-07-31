def product_except_self(nums)
  return nums.reverse if nums.size==2
  product=Array.new(nums.size, 0)
  product[0], product[1]=1, nums[0]
  len, m=nums.size, nums.size/2
  (2..len/2-1).each { |i| product[i]=product[i-1]*nums[i-1] }
  product[-2], product[-1]=nums[-1], 1
  (len-3).downto(len/2+1).each { |i| product[i]=product[i+1]*nums[i+1] }
  l, r=product[m-1]*nums[m-1], product[m+1]*nums[m+1]
  product[m]=l*r
  (m+1..len-1).each { |i| l*=nums[i-1]; product[i]*=l }
  (m-1).downto(0).each { |i| r*=nums[i+1]; product[i]*=r }
  product
end

a=[1, 2, 0, 3]
p product_except_self(a)

