def compare_version(v1,v2)
  v1 = v1.split(".").map(&:to_i)
  v2 = v2.split(".").map(&:to_i)
  (v1.size - v2.size).times { v2 << 0 }
  (v2.size - v1.size).times { v1 << 0 }
  v1.zip(v2).each.map { |(x, y)| x <=> y }.detect{ |n| n != 0 } || 0
end
