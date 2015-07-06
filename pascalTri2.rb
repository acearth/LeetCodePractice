def get_row(row_index)
  len=row_index
  arr=Array.new
  (len+1).times do |i|
    arr[i]=getC(len, i)
  end
  return arr
end

def getC(a, b)
  base=1
  pro=1
  for i in 2..b
    base*=i
  end
  for i in a-b+1..a
    pro*=i
  end
  return pro/base
end
