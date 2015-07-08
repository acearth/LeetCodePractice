# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  return true if s==nil||s.size<2
  i=0
  j=s.size-1
  while i<=j
    while !isAlpha(s[i])
      i+=1
      break if i==s.size-1
    end
    while !isAlpha(s[j])
      j-=1
      break if j==0
    end
    break if s[i].upcase!=s[j].upcase
    i+=1
    j-=1
  end
  if j-i>0
    return false
  else
    return true
  end
end


def isAlpha(cha)
  !!cha.match(/[A-Za-z0-9]/)
end

ss="ab"
p is_palindrome(ss)
ss="a ba"
p is_palindrome(ss)
ss="a."
p is_palindrome(ss)
ss=".,"
p is_palindrome(ss)
ss="aA"
p is_palindrome(ss)
ss="1a2"
p is_palindrome(ss)

