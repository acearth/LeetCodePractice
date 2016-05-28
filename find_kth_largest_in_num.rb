# Returns larger part size
def partition(arr, p, r, s = p - 1)
  p.upto(r - 2) do |i|
    next if arr[i] < arr[r - 1]
    s += 1
    arr[s], arr[i] = arr[i], arr[s]
  end
  arr[r - 1], arr[s + 1] = arr[s + 1], arr[r - 1]
  s + 2
end

def find_kth_largest(num, k)
  p = 0
  r = num.size
  loop do
    q = partition(num, p, r)
    return num[q - 1] if k == q
    q > k ? r = q - 1 : p = q
  end
end
