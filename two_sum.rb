# q-1: better solution for reading and debugging
def two_sum(nums, target)
  has = {}
  nums.each_with_index do |n, i|
    if has[target - n]
      return [has[target - n], i]
    else
      has[n] = i
    end
  end
end

def two_sum_one_liner(nums, target, have = {})
  nums.each_with_index { |n, i| have[k = target - n] ? (return [have[k], i]) : have[n] = i }
end