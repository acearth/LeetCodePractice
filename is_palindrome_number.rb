def is_palindrome(x)
  return false if !(0..2**31-1).include? x
  hbase, lbase= 1, 1
  hbase*=10 while hbase*10<=x
  while hbase>=lbase
    return false if (x/hbase)%10 != (x/lbase)%10
    hbase, lbase = hbase/10, lbase*10
  end
  true
end
