def longest_palindrome(s)
  return s if s.size<2
  return s[0]==s[1]? s:s[0] if s.size==2
  result=Hash.new
  tmp=Array.new
  for i in 0..s.length-2
    tmp.push i if s[i]==s[i+1]
  end
  result[2]=tmp.dup ##
  tmp.clear
  #return s[result[2][0]..result[2][0]+1] if s.length==3
  for i in 0..s.length-3
    tmp.push i if s[i]==s[i+2]
  end
  result[3]=tmp.dup
  len=4
  while len<=s.length
    tmp.clear
    result[len-2].each do |v|
      tmp.push v-1 if (v>0&&v+len-2<s.length)&& s[v-1]==s[v+len-2]
    end
    result[len]=tmp.dup
    len+=1
  end
  len=0
  result.each do |k,v|
    len=k if k>len&&v.size>0
  end
  start=result[len][0]
  s[start..(start+len-1)]
end
s='aba'
p longest_palindrome s
s='abb'
p longest_palindrome s
s='abcba'
p longest_palindrome s

