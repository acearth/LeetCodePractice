# Q-316: monotonic stack and greedy
# @param {String} s
# @return {String}
def remove_duplicate_letters(s)
  tail = {}
  s.chars.each_with_index do |ch, i|
    tail[ch] = i
  end
  seen = {}
  stack = []
  s.chars.each_with_index do |ch, i|
    next if seen[ch]
    seen.delete(stack.pop) while stack.any? && stack.last.ord > ch.ord && tail[stack.last] > i
    stack << ch
    seen[ch] = true
  end
  stack.join
end

# p remove_duplicate_letters("cbacdcbc")