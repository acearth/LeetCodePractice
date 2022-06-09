# q-131: partition palindrome by backtracking
def partition(s)
  result =[]
  backtracking(s,0,[], result)
  result
end

def backtracking(str, start,collected, result)
  return result << [] + collected if start == str.size
  (start...str.size).each do |i|
    sub = str[start..i]
    next unless sub == sub.reverse
    collected << sub
    backtracking(str,i+1, collected, result)
    collected.pop
  end
end