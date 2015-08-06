def next_permutation(nums)
  (nums.sort!;return) if nums.sort==nums.reverse
  cur=nums.size-2
  max=nums[-1]
  (nums.size-2).downto(0) do |cur|
    if nums[cur]<max
      rest=nums[cur..-1].sort
      nextIndex=nil
      rest.each_with_index { |n,i| (nextIndex=i; break) if n>nums[cur] }
      nextValue=rest.delete_at(nextIndex)
      pre= cur>0? nums[0..cur-1]:[]
      ret=pre+[nextValue]+rest
      ret.each_with_index { |n, i| nums[i]=n }
      puts nums
      return
    else
      max=nums[cur]
    end
  end
end

=begin
a=[1, 2, 3]
p next_permutation(a) == [1, 3, 2]
a=[3, 2, 1]
p next_permutation(a)==[1, 2, 3]
a=[1, 1, 5]
p next_permutation(a)

a=[1, 2]
p next_permutation(a)
=end
next_permutation [2,1,2,2,2,2,2,1]

