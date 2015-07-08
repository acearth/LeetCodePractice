# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
  d=(a.length-b.length).abs
  align=String.new
  d.times do
    align+="0"
  end
  if a.length>b.length
    b=align+b
  else
    a=align+a
  end
  com=0
  v=0
  i=a.length-1
  while i>-1
    v=a[i].to_i+b[i].to_i+com
    com=v/2
    v=v%2
    b[i]=v.to_s
    i-=1
  end
  if com==1
    b="1"+b
  end
  return b
end

a="00010"
b="00010"
p add_binary(a, b)

