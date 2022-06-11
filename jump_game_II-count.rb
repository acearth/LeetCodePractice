# Q-45: Jump game II
# in greeding easy but good solution
def jump(nums)
  reach = next_reach = jump = 0
  nums.size.times do |i|
    next_reach = [next_reach, i + nums[i]].max
    next unless i == reach
    break if reach >= nums.size - 1
    jump += 1
    reach = next_reach
  end
  jump
end

# bfs(in 2015) method is TLE now(2022)
def jump(nums)
  dest = nums.size - 1
  visited, q = [], []
  map = []
  nums.each_with_index { |n, i| map[i] = [i, n, -1]; visited[i] = false }
  q.push map[0]
  while q.size > 0
    cur, stepSize, curStep = q.shift
    return map[dest][2] + 1 if cur == dest
    map[cur][2] = curStep + 1
    (stepSize).downto(1) do |i|
      nexti = cur + i
      if !visited[nexti] && map[nexti] != nil
        map[nexti][2] = map[cur][2]
        return map[dest][2] + 1 if nexti == dest
        q << map[nexti]
        visited[nexti] = true
      end
    end
  end
end

a = [2, 3, 1, 1, 4]
p jump(a)

#greedy method needs to learn .

# Q-45: Jump game II.  Not good enough. Greeding:q
# Need to use new loop method
def jump(nums)
  jumped = curr = 0
  while curr < nums.size - 1
    next_curr = cur_max = 0, 0
    nums[curr].times do |i|
      next_step = curr + i + 1
      return jumped + 1 if next_step >= nums.size - 1
      next_step_range = next_step + nums[next_step]
      if next_step_range > cur_max
        next_curr = next_step
        cur_max = next_step_range
      end
    end
    curr = next_curr
    jumped += 1
  end
  jumped
end