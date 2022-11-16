# Q-738
def monotone_increasing_digits(n)
  n = n.to_s.chars.map(&:to_i)
  i = n.size - 2

  mark = n.size
  (n.size - 2).downto(0) do |i|
    if n[i] > n[i + 1]
      n[i] -= 1
      mark = i + 1
    end
  end
  (n[0...mark] + [9] * (n.size - mark)).join.to_i
end
