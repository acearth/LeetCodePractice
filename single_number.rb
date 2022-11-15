# Q-136
def single_number(nums)
  nums.inject(:^)
end

def single_number(nums)
    nums.reduce(0,&:^)
end
