# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  return [] if digits==nil||digits.size<1
  arr=digits.reverse
  com=0
  arr[0]+=1
  digits.length.times do |i|
    va=arr[i]+com
    com=va/10
    va=va%10
    arr[i]=va
  end
  arr<<com if com>0
  arr.reverse!
  return arr
end
p plus_one [0]
