def isValid(str)
  return str.size==1 if str[0]=='0'
  return str.to_i>0&&str.to_i<256
end

def dfs(str,tmpLine,result,count)
  return if count==4||str==nil
  return result.push tmpLine+str if count==3 && isValid(str)
  t=[str.length,3].min
  for i in 0..t do
    if isValid str[0..i]
      dfs(str[i+1..-1],tmpLine+str[0..i]+'.',result,count+1)
    end
  end
end

def restore_ip_addresses(s)
  result=Array.new
  return result if s.length<4||s.length>12
  dfs(s,"",result,0)
  result
end

st="25525511135"
p restore_ip_addresses st
st='1111'
p restore_ip_addresses st
st="0000"
p restore_ip_addresses st


