def find_repeated_dna_sequences(s)
  count = Hash.new { |hash,key| hash[key] = 0 }
  (s.size - 9).times { |i| count[s[i..i+9]] += 1 }
  count.reject { |k,v| v < 2}.keys
end
