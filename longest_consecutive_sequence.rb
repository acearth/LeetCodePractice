# Q-128
def longest_consecutive(nums)
  hash = nums.to_h { |i| [i, true] }
  longest = 0
  nums.each do |n|
    next unless hash[n]
    hash[n] = false
    count = 1
    [-1, 1].each do |i|
      k = n + i
      while hash[k]
        hash[k] = false
        count += 1
        k += i
      end
    end
    longest = count if longest < count
  end
  longest
end
