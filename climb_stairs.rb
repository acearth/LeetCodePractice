def climb_stairs(n)
  steps = [1, 1]
  (n-1).times { steps << steps[-2] + steps[-1] }
  steps[n]
end
