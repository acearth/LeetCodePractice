def maximum_gap(nums)
  return 0 if nums.size<2||nums.max==nums.min
  bucketLen=[1, (nums.max-nums.min)/nums.size].max
  lowest=nums.min ## necessary! 
  buckets=[]
  bucketMin=[]
  bucketMax=[]
  ((nums.max-nums.min+1)/bucketLen + 1).times { buckets<<[] }
  nums.each do |n|
    i=(n-lowest)/bucketLen  ## If not declared lowest, the machine will evaluate nums.min every time !
    if !buckets[i].include? n
      buckets[i]<< n 
      bucketMax[i]=n if bucketMax[i]==nil ||bucketMax[i]<n
      bucketMin[i]=n if bucketMin[i]==nil ||bucketMin[i]>n
    end
  end
  last=bucketMax[0]
  gap=0
  1.upto(buckets.size-1) do |i|
    if buckets[i].size>0
      gap=[bucketMin[i]-last, gap].max
      last=bucketMax[i]
    end
  end
  gap
end
