def reverse_bits(n)
  mirror=%w[0 8 4 c 2 a 6 e 1 9 5 d 3 b 7 f].each_with_index.to_h
  mirror.each { |k, v| mirror[k]=v.to_s(16) }
  res=n.to_s(16).chars.map { |ch| mirror[ch] }.reverse
  padding=["0"]*(8-res.size)
  (res+padding).join.to_i(16)
end
