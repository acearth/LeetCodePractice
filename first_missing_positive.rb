def first_missing_positive(nums)
  nums.each { |n| put(nums, n) }
  nums.each_with_index { |n, i| return i+1 if i+1 != n }
  nums.size+1
end

def put(arr, n)
  return if arr[n-1] == n || (!(1..arr.size).include? n)
  nxt = arr[n-1]
  arr[n-1]=n
  put(arr, nxt)
end
