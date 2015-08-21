def unique_paths(m, n)
  m,n=n,m if m>n
  return 1 if m==1 ##if not, 1..m-1 with yield nil out
  (n..n+m-2).inject(:*)/(1..m-1).inject(:*)
end
