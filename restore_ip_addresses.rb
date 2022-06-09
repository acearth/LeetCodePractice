# Q-93: backtracking to restore it
def restore_ip_addresses(s)
  result = []
  backtracking(s, 0, [], result)
  result
end

def backtracking(str, start, collected, result)
  return result << collected.join('.') if collected.size == 4 && start == str.size
  (start...str.size).each do |i|
    break if str[start..i].to_i > 255 || (str[start] == '0' && i > start)
    collected << str[start..i]
    backtracking(str, i + 1, collected, result)
    collected.pop
  end
end