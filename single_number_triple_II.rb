def single_number(nums)
  resultP=[0]*32
  resultN=[0]*32
  nums.each do |i|
    n=i.to_s(2).reverse
    n.chars.each_with_index{|ch,i| resultP[i]+=1 if ch=='1'} if i>=0
    n.chars.each_with_index{|ch,i| resultN[i]+=1 if ch=='1'} if i<0
  end
  resultP.reverse.map{|i|i%3}.join.to_i(2)-resultN.reverse.map{|i| i%3}.join.to_i(2)
end
a=[3,3,3,1]
p single_number(a)
a=[-2,-2,1,1,-3,1,-3,-3,-4,-2]
p single_number(a)

