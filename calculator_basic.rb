def calculate(s)
  tokens=getExpression(s)
  resultStack=[]
  openStack=[]
  tokens.each_with_index do |token, i|
    if token=="("
      resultStack<<token
      openStack<<resultStack.size-1 ##position
    elsif token==")"
      cur=openStack.pop
      lastValue=calculate_pure(resultStack[cur+1..-1])
      resultStack=resultStack[0...cur]+[lastValue]
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
    else
      arr[0]=arr[0]-arr[cur]
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
    elsif /[\(|\)|+|-]/ =~ ch
      result<<tmp if tmp!=nil
      result<<ch
      tmp=nil
    end
  end
  result<<tmp if tmp!=nil
  result
end

s="1 + 1"
p calculate(s)
s=" 2-1 + 2 "
p calculate(s)
s="( 1+(4+5+2)-3)+(6+8)"
p calculate(s)

