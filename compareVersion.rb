def compare_version(version1, version2)
  v1=version1.split(".")
  v2=version2.split(".")
  c1=Array.new
  c2=Array.new
  c1.push v1
  c2.push v2
  c1.flatten!
  c2.flatten!
  l1=c1.size
  l2=c2.size
  d1=Array.new
  d2=Array.new
  for i in 0..l1-1
    d1[i]=c1[i].to_i
  end
  for i in 0..l2-1
    d2[i]=c2[i].to_i
  end
  if l1>l2
    for i in l2..l1-1
      d2[i]=0
    end
  elsif l1<l2
    for i in l1..l2-1
      d1[i]=0
    end
  end

  len=[d1.size, d2.size].min
  len.times do |i|
    return 1 if d1[i]>d2[i]
    return -1 if d1[i]<d2[i]
  end
  return 0
end


p compare_version("01", "1")
p compare_version("1", "1.1")


