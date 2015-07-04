def hamming_weight(n)

  s=n.to_i.to_s(2)
  line=s.to_s
  v=0
  line.length.times do |i|
    if line[i].to_i==1 then
      #v=v+1
      v+=1
    end
  end
  return v
end

p hamming_weight(3)
p hamming_weight(4)
p hamming_weight(6)
