# Q-132: DP with 2 arrays
# 1/jan/2023
# @param {String} s
# @return {Integer}
def min_cut(s)
  len = s.size
  palindrome = len.times.map { [false] * len }
  (len - 1).downto(0) do |i|
    (i...len).each do |j|
      palindrome[i][j] = s[i] == s[j] && (j - i < 2 || palindrome[i + 1][j - 1])
    end
  end
  cuts = [len] * len
  len.times do |tail|
    min = tail
    (1 + tail).times do |cut_point|
      next unless palindrome[cut_point][tail]
      min = cut_point == 0 ? 0 : [min, cuts[cut_point - 1] + 1].min
    end
    cuts[tail] = min
  end
  cuts.last
end

p min_cut('aab')
p min_cut('a')