def unique_paths(m, n)
  state=[1] * n
  (m-1).times do |i|
    1.upto(n-1){|j| state[j]+=state[j-1] }
  end
  state[-1]
end
