# note:: the maximum count of majority number is less than 3, according to the definition of the question. So hash in my solution is Not neccessary. Can just use two count and two another integer stand for those two element
#

def majority_element(nums)
  res=Array.new
  ma=Hash.new
  return nums if nums.size<2
  nums.size.times do |i|
    v1=nums[i]
    if ma[v1]!=nil
      ma[v1]+=1
    else
      if ma.size<3
        ma[v1]=1
      else
        x=ma.values.min
        t=ma.invert
        k=t[x]
        ma.delete k
        ma[v1]=1
      end
    end
  end
  ma.each_key do|k|
    ma[k]=0
  end
  nums.size.times do |i|
    ki=nums[i]
    if ma[ki]!=nil
      ma[ki]+=1
    end
  end
  ma.each do |k,v|
    res<<k if v>nums.size/3
  end
  return res
end


a1=[1, 2, 3, 3, 3]
p majority_element a1

a=[]
p majority_element a
a=[-1,1,1,1,2,1]
p majority_element a

a=[2,2,1,1,1,2,2]
p majority_element a
puts "last"
a=[1,1,1,2,3,4,5,6]
p majority_element a
a=[1,2,0,4,5,0,6,7,8,9,9,9,9,9,9,0,0,0,0,0]
p majority_element a

