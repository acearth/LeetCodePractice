def convert(s, num_rows)
  return s if num_rows == 1
  group_size = num_rows * 2 - 2
  group_count = s.length / group_size + (s.length % group_size == 0 ? 0 : 1)
  res = Array.new(num_rows, '')
  group_count.times do |k|
    group = s[k * group_size ... (k + 1) * group_size]
    res[0] += group[0] || ''
    res[num_rows - 1] += group[num_rows - 1] || ''
    1.upto(num_rows - 2) { |i| res[i] += (group[i] || '') + (group[group_size - i] || '') }
  end
  res.join
end
