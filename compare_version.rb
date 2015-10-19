def compare_version(v1,v2)
  v1 = v1.split(".").map{|i| i.to_i}
  v2 = v2.split(".").map{|i| i.to_i}
  (v1.size - v2.size).times { v2<<0 }
  (v2.size - v1.size).times { v1<<0 }
  v1.size.times do |i|
    t= v1[i]<=>v2[i]
    return t if t!=0
  end
  0
end
