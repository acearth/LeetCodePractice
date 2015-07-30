ram {String} s
# @return {String}
def shortest_palindrome(s)
  return s if s.size==0
  chr=s[0]
  if s.size>1000
    i=0
    while s[i]==s[i+1]
      i+=1
    end
    return s[i+1..-1].reverse+s
  end
  (s.size/2).downto(1) do |i|
    len=i*2 if isSymmetricBySpace(s, i)
    len=i*2+1 if isSymmetricByChar(s, i)
    return s[len..-1].reverse+s if len!=nil
  end
  s[1..-1].reverse+s
end

def isSymmetricByChar(s, i)
  return false if i==0
  c=0
  for d in 1..i
    return c==i if i+d>=s.length||i-d<0
    return false if s[i+d]!=s[i-d]
    c+=1 if s[i+d]==s[i-d]
  end
  return c==i
end

# there should have s[i-1]==s[i]
def isSymmetricBySpace(s, i) 
  return false if i==0
  c=0
  for d in 0..i
    return c==i if i-1-d<0||i+d>=s.length
    return false if s[i+d]!=s[i-1-d]
    c+=1 if s[i+d]==s[i-1-d]
  end
  return false
end

puts "ss"
s='123321'
p shortest_palindrome(s)=="123321"
p shortest_palindrome(s+'44')=='4412332144'
s='12321'
p shortest_palindrome(s)==s
p shortest_palindrome(s+'44')=='44'+s+'44'
p shortest_palindrome('abb')
p shortest_palindrome('111111')

