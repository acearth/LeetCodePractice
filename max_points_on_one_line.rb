def max_points(points, parr = points.map { |p| [p.x, p.y] })
  return parr.size if parr.size < 2
  count = Hash[parr.group_by { |i| i }.map { |k, v| [k, v.size] }]
  parr = parr.uniq
  lines = Hash.new { |h, k| h[k] = [] }.merge([1, 0, parr.first.first] => [parr.first])
  parr.each { |p| parr.each { |q| lines[link(p, q)] << p << q } }
  lines.each { |k, v| lines[k] = v.uniq }.values.map { |v| v.inject(0) { |a, e| a + count[e] } }.max
end

# Return [A, B, C] where Ax + By = C
def link(p1, p2)
  return [1, 0, p1.first] if p1.first == p2.first
  k = (p2.last - p1.last) * 1.0 / (p2.first - p1.first)
  [-k, 1, p1.last - k * p1.first]
end
