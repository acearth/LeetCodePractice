def climb_stairs(n)
  res=[1,1]
  (n+1).times{res << res[-2]+res[-1] }
  res[n]
end


