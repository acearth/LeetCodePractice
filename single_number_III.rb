def get_bits(num)
  return [1]+get_bits(~num)[1..-1] if num<0
  t=[0]*32
  a=num.to_s(2).chars
  a.each_with_index { |ch, i| a[i]= ch=='0' ? 0 : 1 }
  a=t[a.length..-1]+a
  a
end

def single_number(nums)
  bitsCounter=[0]*32
  nums.each { |n| t=get_bits(n); 32.times { |i| bitsCounter[i]+=t[i] } }
  k=0
  32.times { |i| (k=i; break) if bitsCounter[i]%2==1 }
  bitsCounter=[0]*32
  nums.each do |n|
    t=get_bits(n)
    32.times { |i| bitsCounter[i]+=t[i] } if t[k]!=1
  end
  tmp=[0]*32
  bitsCounter.each_with_index { |bc, i| tmp[i]= bc%2 }
  n1= tmp[0]==1 ? -1*(tmp[1..-1].join.to_i(2)+1) : tmp.join.to_i(2)
  nums-=[n1]
  bitsCounter=[0]*32
  nums.each { |n| t=get_bits(n); 32.times { |i| bitsCounter[i]+=t[i] } }
  tmp=[0]*32
  bitsCounter.each_with_index { |bc, i| tmp[i]= bc%2 }
  n2=tmp[0]==1 ? -1*(tmp[1..-1].join.to_i(2)+1) : tmp.join.to_i(2)
  [n1, n2]
end

a=[1, 2, 1, 3, 2, 5]
p single_number(a)
a=[-1, 0]
p single_number(a)
a=[-1139700704, -1653765433]
p single_number(a)

