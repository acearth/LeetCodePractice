def getExpression(str)
  result=[]
  tmp=nil
  str.chars.each do |ch|
    if /\d/=~ ch
      tmp=0 if tmp==nil
      tmp*=10
      tmp+=ch.to_i
    elsif /[\*|+|-]/ =~ ch
      result<<tmp if tmp!=nil
      result<<ch
      tmp=nil
    end
  end
  result<<tmp if tmp!=nil
  result
end

def op(a, b, opr)
  if opr=='+'
    return a+b
  elsif opr=='-'
    return a-b
  end
  return a*b
end

def compute_pure(arr)
  return [arr[0]] if arr.size==1
  result,m=[],1
  while m<arr.size-1
    compute_pure(arr[0...m]).each do |i|
      compute_pure(arr[m+1..-1]).each do |j|
        result<<op(i, j, arr[m])
      end
    end
    m+=2
  end
  result
end

def diff_ways_to_compute(input)
  compute_pure(getExpression(input)).sort
end

a1="2*3-4*5"
p diff_ways_to_compute(a1)
