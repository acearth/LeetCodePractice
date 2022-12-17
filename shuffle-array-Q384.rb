# Q-384: shuffle: clone is necessary
# 17/dec/2022
class Solution

=begin
    :type nums: Integer[]
=end
  def initialize(nums)
    @nums = nums
    @len = nums.size
    @original = nums.dup
  end

=begin
    :rtype: Integer[]
=end
  def reset()
    @nums = @original.dup
  end

=begin
    :rtype: Integer[]
=end
  def shuffle()
    @len.times do |i|
      sf = rand(@len)
      @nums[i], @nums[sf] = @nums[sf], @nums[i]
    end
    @nums
  end
end

# Your Solution object will be instantiated and called as such:
# obj = Solution.new(nums)
# param_1 = obj.reset()
# param_2 = obj.shuffle()
