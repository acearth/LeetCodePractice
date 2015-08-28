def add_binary(a, b)
  return add_binary(b, a) if a.size<b.size
  a=a.chars.map { |ch| ch.to_i }.reverse
  b=b.chars.map { |ch| ch.to_i }.reverse
  b += [0]*(a.size-b.size)
  com=0
  b.each_with_index do |n, i|
    value=n+com+a[i]
    a[i]=value%2
    com=value/2
  end
  a<<1 if com>0
  a.reverse.join.to_s
end
