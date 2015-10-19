def work(str)
  return 0 if str.length==0
  return -1*work(str[1..-1]) if str[0]=='-'
  return work(str[1..-1]) if str[0]=='+'
  res=0
  str.chars.each do |ch|
    res+=ch.ord-'0'.ord
    res*=10
  end
  res/=10
  res
end

def my_atoi(str)
  str.strip!
  return 0 if str.length<1
  set=%w[+ - 0 1 2 3 4 5 6 7 8 9]
  return 0 if not set.include? str[0]
  str[1..-1].chars.each_with_index do |ch, i|
    return check_range(work(str[0..i])) if ch.ord<48||ch.ord>57
  end
  check_range(work(str))
end

def check_range(n)
  return -1*2**31 if n<-1*2**31
  return 2**31-1 if n>2**31-1
  n
end
