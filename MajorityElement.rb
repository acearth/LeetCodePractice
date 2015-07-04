def findMajor(nums)
  currInt=-1
  currTimes=-1
  for key in nums do
    if currInt==key
      currTimes+=1
    else
      currTimes-=1
    end
    if currTimes<1
      currInt=key
      currTimes=1
    end
  end
  return currInt
end



p findMajor [1,1,2,3,3,3,3,3]
p findMajor [1]

