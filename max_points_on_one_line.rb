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

# Q-149: geo
# 23/nov/2023
# @param {Integer[][]} points
# @return {Integer}
require 'set'
AMPLIFIED=1_000_000_000.freeze
def max_points(points)
  return points.size if points.size < 2
  lines = Hash.new { |h, k| h[k] = Set.new }
  points.size.times do |i|
    (i + 1...points.size).each do |j|
      lines[ax_by_eq_c(points[i], points[j])] += [points[i], points[j]]
    end
  end
  # p lines
  lines.keys.map { |key| lines[key].size }.max
end

def ax_by_eq_c(p1, p2)
  if p1.first == p2.first
    return [1, 0, p1.first]
  elsif p1.last == p2.last
    return [0, 1, p1.last]
  else
    k = (p2.last - p1.last).fdiv((p2.first - p1.first))
    b = p2.last - k * p2.first
    return [(-1 * k * AMPLIFIED).to_i, AMPLIFIED, (-b * AMPLIFIED).to_i]
  end
end