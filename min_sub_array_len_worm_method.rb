#Q-207:
# sliding window // worm method
def min_sub_array_len(s, nums)
  len = 2 << 32 #initialized as MAX_VALUE
  sum = tail = head = 0
  while head < nums.length
    sum += nums[head]
    head += 1
    while sum >= s
      len = [len, head - tail].min
      sum -= nums[tail]
      tail += 1
    end
  end
  len == 2 << 32 ? 0 : len
end