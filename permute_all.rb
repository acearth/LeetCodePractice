def permute(a)
  return [a] if a.size<2
  pre=permute(a[0...-1])
  res,v=[],a[-1]
  0.upto(pre.size-1){|i| res+=insert_list(pre[i],v) } # do NOT use pre.each
  res
end

def insert_list(a,v)
  return [v] if a.length<1
  res=[]
  0.upto(a.length){|i| res<<a[0...i]+[v]+a[i..-1] }
  res
end
