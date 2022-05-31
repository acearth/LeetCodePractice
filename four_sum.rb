# Originally Accepted at least on 20/aug/2015, but TLE on 31/may/2022
# TLE solved by ignoring repetition probing on 31/may/2022
def four_sum(nums, target)
  nums.sort!
  # create hash with default value:[]
  two_sum, result = Hash.new { |h, k| h[k] = [] }, []
  nums.size.times do |i|
    (i + 1...nums.size).each do |j|
      two_sum[nums[i] + nums[j]] += [[i, j]]
    end
  end
  nums.size.times do |i|
    # important speedup to remove repeated calculation
    next if nums[i] == nums[i - 1] && i > 0
    (i + 1...nums.size - 2).each do |j|
      #important condition: j > i + 1 , j = i + 1 need to be reached once at least
      next if nums[j] == nums[j - 1] && j > i + 1
      expected = target - nums[i] - nums[j]
      two_sum[expected].each do |a, b|
        # ensure the order
        result << [nums[i], nums[j], nums[a], nums[b]] if a > j
      end
    end
  end
  result.uniq
end

# DFS solution but TLE on 31/may/2022
def four_sum_dfs(nums, target)
  nums.sort!
  result = []
  dfs_search(nums, 0, 4, target, [], result)
  result.uniq
end

def dfs_search(nums, i, remain_steps, target, cur_list, result)
  return cur_list.sum == target ? result << cur_list : nil if remain_steps == 0
  (i...nums.size).each do |j|
    next if nums[j] == nums[j - 1] && j > i
    dfs_search(nums, j + 1, remain_steps - 1, target, cur_list + [nums[j]], result)
  end
end

# a = [1, 0, -1, 0, -2, 2]
# p four_sum(a, 0)
#
# a = [-3, -2, -1, 0, 0, 1, 2, 3]
# p four_sum(a, 0)
#
#
# a = [2, 2, 2, 2, 2]
# p four_sum(a, 8)
# a = [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
# p a.size
# p four_sum(a, 8)