# Q-228
def summary_ranges(nums)
  result = []
  return nums unless nums.any?
  nums.each do |n|
    if (result.any? && n == result.last.last + 1)
      result.last[1] += 1
    else
      result << [n, n]
    end
  end
  result.map { |left, right| left == right ? "#{left}" : "#{left}->#{right}" }
end

p summary_ranges([0, 1, 2, 4, 5, 7])
