# Q-739: monotone stack
def daily_temperatures(tmp)
  stack = []
  result = [0] * tmp.size
  tmp.each_with_index do |t, i|
    while stack.any? && tmp[stack.last] < t
      day = stack.last
      result[day] = i - stack.pop
    end
  end
  result
end