def anagrams(strs)
  hash=Hash.new
  strs.each do |w|
    a=[]
    w.size.times do |i|
      a.push(w[i])
    end
    a.sort!
    hash[a]=[] if hash[a]==nil
    hash[a].push w
  end
  result=[]
  hash.each {|k,v| result.push v if v.size>1}
  result
end


p anagrams ["abc", "cba"]
p anagrams ["", ""]
p anagrams [""]
p anagrams ["1abc", "cba"]
p anagrams ["", "b"]


