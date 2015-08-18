def num_distinct(s,t)
  len=t.size
  prefix=[1]+[0]*len
  s.chars.each do |ch|
    len.downto(1) {|i| prefix[i]=prefix[i-1]+prefix[i] if t[i-1]==ch}
  end
  prefix[-1]
end
s,t="aabb","ab"
p num_distinct(s,t)
