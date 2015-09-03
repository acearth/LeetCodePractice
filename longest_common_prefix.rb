
def longest_common_prefix(strings)
  prefix=""
  return prefix if strings==nil||strings[0]==nil
  size=strings.length
  return strings[0] if size==1
  tmpl=strings[0]
  tmpl.length.times do |i|
    l=0
    for j in 1..size-1
      break if strings[j][i]==nil
      break if strings[j][i]!=tmpl[i]
      l+=1
    end
    if size==l+1
      prefix+=tmpl[i]
    else
      break
    end
  end
  return prefix
end

st=["",""]
st=["abc","abcd"]
p longest_common_prefix st
st=["",""]
p longest_common_prefix st

