# reflect gray code. refer to Combinatorics::Richard
def gray_code(n)
  return [0] if n<1
  return [0,1] if n==1
  result=Array.new
  baseLine=String.new
  n.times do
    baseLine+='0'
  end
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
  return result
end

def sigma(line)
  count=0
  line.length.times do |i|
    count+=1 if line[i]=='1'
  end
  return count%2==0
end

def changeBit(line, index)
  if line[index]=='1'
    line[index]='0'
  else
    line[index]='1'
  end
  return line
end

def findPosition(line)
  cur=line.length-1
  while line[cur]=='0'
    cur-=1
    break if cur==0
  end
  return cur-1
end
