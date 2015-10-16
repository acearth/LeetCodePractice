def gray_code(n)
  return [0] if n==0
  res1=gray_code(n-1)
  res2=res1.reverse
  shift=2**(n-1)
  res2.each_with_index{|n,i| res2[i]=n+shift }
  res1+res2
end

# reflect gray code. refer to Combinatorics::Richard
def gray_code(n)
  return [0] if n<1
  return [0,1] if n==1
  result=Array.new
  baseLine='0'*n
  terminLine='1'+baseLine[1..n]
  result.push Integer("0b"+baseLine)
  while baseLine!=terminLine
    if sigma baseLine
      baseLine=changeBit(baseLine, baseLine.length-1)
    else
      baseLine=changeBit(baseLine, findPosition(baseLine))
    end
    result.push Integer("0b"+baseLine)
  end
  result
end

def sigma(line)
  count=0
  line.length.times {|i| count+=1 if line[i]=='1'}
  count%2==0
end

def changeBit(line, index)
  if line[index]=='1'
    line[index]='0'
  else
    line[index]='1'
  end
  line
end

def findPosition(line)
  cur=line.length-1
  while line[cur]=='0'
    cur-=1
    break if cur==0
  end
  cur-1
end
