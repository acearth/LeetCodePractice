# @param {Integer} n
# @return {String}
def convert_to_title(n)
data=n.to_i
  s=String.new
  com=0
  while data> 26
    r=data%26-com
    com=0
    if(r==0)
      r=26
      com=1
    end
    ch=(r+64).chr
    s=s+ch
    data/=26
  end
  if(data==1&&com==1)
      return s.reverse
  else
  ch=(data+64-com).chr
  s+=ch
  end
  return s.reverse
  end
