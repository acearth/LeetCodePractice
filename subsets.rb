def subsets(arr)
  return [[]] if arr.size==0
  pre=subsets(arr[0...-1])
  psize, last =pre.size, arr[-1]
  0.upto(psize-1){|i|pre << Array.new(pre[i])+[last]}
  psize.upto(pre.size-1){|i| pre[i].sort!}
  pre
end

