# Q-414: 3 pointers
# @param {Integer[]} nums
# @return {Integer}
def third_max(nums)
  max = [-1 * 2 ** 33] * 3
  nums.each do |n|
    if n > max[0]
      max = [n] + max[0..1]
    elsif n > max[1] && n != max[0]
      max[1..2] = [n, max[1]]
    elsif n > max[2] && n != max[1] && n != max[0]
      max[2] = n
    end
  end
  max[2] == -1 * 2 ** 33 ? max.max : max[2]
end
