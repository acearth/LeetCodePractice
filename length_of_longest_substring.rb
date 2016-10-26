# @tag: two-pointers
def length_of_longest_substring(s)
  solution = base = 0
  index = Hash.new { |hash, key| hash[key] = -1 }
  s.length.times do | cur|
      base = [base, index[s[cur]] + 1].max
      solution = [solution, cur - base + 1].max
      index[s[cur]] = cur
  end
  solution
end
