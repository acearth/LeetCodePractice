# Q-360: second-order curve: Math
# 17/dec/2022
def sort_transformed_array(nums, a, b, c)
  if a == 0
    result = nums.map { |n| b * n + c }
    return b > 0 ? result : result.reverse
  end
  apex = -b / (2.0 * a)
  i_apex = nil
  diff = 2 ** 32
  nums.each_with_index do |n, k|
    next if (n - apex).abs > diff
    i_apex = k
    diff = (n - apex).abs
  end
  result = [value(nums[i_apex], a, b, c)]
  left, right = i_apex - 1, i_apex + 1
  while left >= 0 && right < nums.size
    if (apex - nums[left]) > (nums[right] - apex)
      result << value(nums[right], a, b, c)
      right += 1
    else
      result << value(nums[left], a, b, c)
      left -= 1
    end
  end
  while left >= 0
    result << value(nums[left], a, b, c)
    left -= 1
  end
  while right < nums.size
    result << value(nums[right], a, b, c)
    right += 1
  end
  a > 0 ? result : result.reverse
end

def value(i, a, b, c)
  i ** 2 * a + b * i + c
end
