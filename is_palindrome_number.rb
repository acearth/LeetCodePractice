# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  return false if !(0..2**31-1).include? x
  hbase=1
  while x/hbase>0
    hbase*=10
  end
  while x>9
    hbase/=10
    h=x/hbase
    l=x%10
    return false if h!=l
    x-=h*hbase
    x-=l
    x/=10
    hbase/=10
    while x*10<hbase
      hbase/=100
      return false if x%10!=0
      x/=10
    end
  end
  return true
end

p is_palindrome 121
p is_palindrome 1000021

p is_palindrome 9999
p is_palindrome 1000110001

