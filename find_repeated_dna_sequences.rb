def find_repeated_dna_sequences(s)
  upper=s.size-9
  hash=Hash.new
  result=[]
  upper.times do |i|
    cur=s[i..i+9]
    hash[cur] = hash[cur]==nil ? 1 : (hash[cur]+1)
  end
  hash.each{|k,v| result<<k if v>1}
  result
end
