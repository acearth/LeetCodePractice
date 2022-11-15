# Q-215: quick select for kth largest
# NOTE: partition method changed on comparison
def find_kth_largest(nums, k)
  left, right = 0, nums.size - 1
  while (q = partition(nums, left, right)) != k - 1
    if q > k - 1
      right = q - 1
    else
      left = q + 1
    end
  end
  nums[q]
end

def partition(nums, left, right)
  x = rand(right - left) + left
  nums[x], nums[right] = nums[right], nums[x]
  i = left - 1
  (left...right).each do |j|
    next if nums[j] < nums[right]
    i += 1
    nums[i], nums[j] = nums[j], nums[i]
  end
  nums[i + 1], nums[right] = nums[right], nums[i + 1]
  i + 1
end

p find_kth_largest([3, 2, 1, 5, 6, 4], 2) == 5

def max_heapify(arr, i, size)
  l = i * 2 + 1
  r = i * 2 + 2
  larger = i
  larger = l if l < size && arr[l] > arr[larger]
  larger = r if r < size && arr[r] > arr[larger]
  return if larger == i
  arr[i], arr[larger] = arr[larger], arr[i]
  max_heapify(arr, larger, size)
end

def find_kth_largest_heap_sort(nums, k)
  (nums.size / 2).downto(0) do |i|
    max_heapify(nums, i, nums.size)
  end
  k.times do |i|
    n = nums.size - 1 - i
    nums[0], nums[n] = nums[n], nums[0]
    max_heapify(nums, 0, n)
  end
  nums[nums.size - k]
end
