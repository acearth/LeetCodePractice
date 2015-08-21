def partition(s)
  result=[[s[0]]]
  s[1..-1].chars.each do |ch|
    if (result[-1]+ch).reverse==(result[-1]+ch)
      result[-1]+=ch
    elsif result.size>1
      tmp=result[-2]+result[-1]+ch
      result=result[0..-3]+[tmp] if tmp.reverse==tmp
    end
  end
  result
end

s='aab'
p partition(s)
s='efe'
p partition(s)
s="fff"
p partition(s)
s="abbab"
p partition(s)

