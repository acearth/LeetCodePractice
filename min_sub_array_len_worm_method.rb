def min_sub_array_len(s, nums)
  ans = 2 << 32
  sum = tail = front = 0
  len = nums.length
  while front < len
    sum += nums[front]
    front += 1
    while sum >= s
      ans = [ans, front-tail].min
      sum -= nums[tail]
      tail += 1
    end
  end
  ans == 2 << 32 ? 0 : ans
end
