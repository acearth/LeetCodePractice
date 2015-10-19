def climb_stairs(n)
  res=[1,1]
  50.times{res << res[-2]+res[-1] }
  res[n]
end


