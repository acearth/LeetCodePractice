# @param {Integer} n
# @param {Integer} k
# @return {Integer[][]}
def combine_2015(n, k)
  head, tail = (1..k).to_a, (n - k + 1..n).to_a
  result = [[] + head]
  while head != tail
    last = k - 1
    last -= 1 while head[last] == tail[last]
    head[last] += 1 #increase head
    (last + 1...k).each { |i| head[i] = head[i - 1] + 1 } #reset combination
    result << [] + head
  end
  result
end

def combine_dfs(n, k)
  dfs(0, [], k, n)
end

def dfs(start, comb, k, n)
  if comb.size == k
    [comb]
  else
    (start + 1..n).flat_map do |cur|
      dfs(cur, comb + [cur], k, n)
    end
  end
end

# @param {Integer} n
# @param {Integer} k
# @return {Integer[][]}
def combine_pascal(n, k)
  return [(1..k).to_a] if k == 0 || k == n
  combine_pascal(n - 1, k - 1).map { |line| line + [n] } + combine_pascal(n - 1, k)
end

def combine(n,k)
  combine_pascal(n,k)
  # combine_2015(n,k)
  # combine_dfs(n,k)
end