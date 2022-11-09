# Q-35: note: return left
def search_insert(nums, target)
    left, right = 0, nums.size
    
    while left < right
        m = (left+right)/2
        return m if nums[m]==target
        if nums[m] > target
            right=m
        else
            left=m+1
        end
    end
    left
end

