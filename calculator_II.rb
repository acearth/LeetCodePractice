def calculate(s)
  tokens=getExpression(s)
  tmp=[]
  resultStack=[]
  tokens.each_with_index do |token, i|
    if /[\/|\*]/ =~ token.to_s
      tmp=[resultStack.pop] if tmp.size==0
      tmp<<token
    elsif /[+|-]/ =~ token.to_s
      resultStack<<token
    elsif tmp.size!=0
      tmp<<token
      resultStack<<calculate_pure(tmp)
      tmp=[]
    else
      resultStack<<token
    end
  end
  calculate_pure(resultStack)
end

def calculate_pure(arr)
  cur=2
  while cur<arr.size
    if arr[cur-1]=='+'
      arr[0]=arr[0]+arr[cur]
    elsif arr[cur-1]=='-'
      arr[0]=arr[0]-arr[cur]
    elsif arr[cur-1]=='*'
      arr[0]=arr[0]*arr[cur]
    else
      arr[0]=arr[0]/arr[cur]
    end
    cur+=2
  end
  arr[0]
end
def getExpression(str)
  result=[]
  tmp=nil
  str.chars.each do |ch|
    if /\d/=~ ch
      tmp=0 if tmp==nil
      tmp*=10
      tmp+=ch.to_i
    elsif /[\*|\/|+|-]/ =~ ch
      result<<tmp if tmp!=nil
      result<<ch
      tmp=nil
    end
  end
  result<<tmp if tmp!=nil
  result
end

s='3+2*2'
p calculate(s)
s='3+2/2'
p calculate(s)
s=" 3+5 / 2 "
p calculate(s)

