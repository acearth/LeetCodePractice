# Q-647
def count_substrings_two_pointers(s)
  count = 0
  i = 0
  while i < s.size
    j = 0
    while j <= i
      count += 1 if s[j..i] == s[j..i].reverse
      j += 1
    end
    i += 1
  end
  count
end

def count_substrings(s)
  dp = s.size.times.map { [0] * s.size }
  (s.size - 1).downto(0) do |i|
    (i...s.size).each do |j|
      next unless s[i] == s[j]
      if j - i <= 1
        dp[i][j] = 1
      else
        dp[i][j] = dp[i + 1][j - 1]
      end
    end
  end
  dp.map { |line| line.sum }.sum
end

# p count_substrings('abc')==3
# p count_substrings('bbb')==6
# p count_substrings("fdsklf")==6