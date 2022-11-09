# Q-6
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


# 09/nov/2022
def convert_neo(s, num_rows)
    return s if num_rows==1
    result = num_rows.times.map{[]}
    dv=[1,0]
    dd=[-1,1]
    h,v = 0, 0
    diff=nil
    s.chars.each_with_index do |ch, i|
        result[h][v]=ch
        if h==0
            diff=dv
        elsif h==num_rows - 1
            diff=dd
        end
        h, v = (diff.first + h)%num_rows, diff.last + v
    end
    result.join
end
