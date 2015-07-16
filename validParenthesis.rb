# is a string of parethesises is valid ?
def is_valid(s)
  st=Array.new
  com=Hash.new
  com['(']=')'
  com['[']=']'
  com['{']='}'

  s.size.times do |i|
    st.push s[i]
  end
  i=0
  while i<st.size-1
    if st[i+1]==com[st[i]]
      st.delete_at(i)
      st.delete_at(i)
      i-=1 if i>0
    else
      i+=1
    end
  end
  return st.size==0
end

p true == is_valid("()")
p true == is_valid("()[]{}")
p false == is_valid( "([)]")
p true == is_valid("([])")


