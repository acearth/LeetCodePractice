# Q-53
# This method can be implemented at least in 6 ways in O(n) time.

# Way 1: answer = current sum - minimum sum got
def max_sub_array(nums)
  answer = sum = min_sum = nums[0]
  min_sum = 0 if nums[0] > 0
  nums[1..-1].each do |n|
    sum += n
    answer = [answer, sum - min_sum].max
    min_sum = sum if sum < min_sum
  end
  answer
end

# Way 2: optimized dp method
def max_sub_array(nums)
  max = value = nums[0]
  nums[1..-1].each do |n|
    value = value + n > n ? value + n : n
    max = value if value > max
  end
  max
end

# Way 3: divide and conquer 
def max_sub_array(nums)
  return -2 ** 32 if nums == []
  mid = nums.size / 2
  return nums[0] if mid == 0
  answer = [max_sub_array(nums[0..mid - 1]), max_sub_array(nums[mid..-1])].max
  now, may = nums[mid], nums[mid]
  (mid - 1).downto(0) { |i| may = [may, now += nums[i]].max }
  now = may
  (mid + 1..nums.size - 1).each { |i| may = [may, now += nums[i]].max }
  [may, answer].max
end

# Way 4: bit ops
#

# way-5: easy DP
def max_sub_array(nums)
  dp = [-1 * 2 ** 32] * (nums.size + 1)
  nums.each_with_index do |n, i|
    if dp[i] + n > n
      dp[i + 1] = dp[i] + n
    else
      dp[i + 1] = n
    end
  end
  dp.max
end

# Way 5: primitive dp method



# way 3: ALGO-book
def max_sub_array_divide_conquer(nums)
    divide_max(nums,0,nums.size - 1)
end

def cross_max(nums, low, mid, high)
    left_max=right_max=-1*2**32
    sum=0
    left=right=mid
    mid.downto(low) do |i|
        sum+=nums[i]
        next if sum < left_max
        left_max = sum
        left=i
    end
    sum=0
    (mid+1..high).each do |i|
        sum+=nums[i]
        next if sum < right_max
        right_max=sum
        right=i
    end
    left_max+right_max
end


def divide_max(nums, low, high)
    return nums[low] if low==high
    mid = (low+high)/2
lmax=divide_max(nums,low, mid)
rmax=divide_max(nums,mid+1,high)
cmax=cross_max(nums,low,mid,high)
    if lmax >= rmax && lmax>=cmax
        lmax
    elsif rmax>= lmax && rmax >=cmax
        rmax
    else
        cmax
    end
end
    
