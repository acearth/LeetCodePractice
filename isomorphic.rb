def is_isomorphic(s, t)
  count=-1
  hash1,hash2={},{}
  s.chars.each do |ch|
    if not hash1[ch]
      count+=1
      hash1[ch]=count
    end
  end
  count=-1
  t.chars.each do |ch|
    if not hash2[ch]
      count+=1
      hash2[ch]=count
    end
  end
  s.chars.map{|i| hash1[i] } == t.chars.map{|i| hash2[i] }
end
