def getALineArray(arr,stateOrigin)
  at=Array.new
  cur=0
  state=stateOrigin.to_s
  len=state.length
  len.times do |i|
    if state[i]=="1"
      at[cur]=arr[i]
      cur+=1
    end
  end
  return at
end

def getStateLine(k,len)
  a=k.to_s(2)
  dl=len-a.length
  if dl>0
    a.reverse!
    dl.times do
      a+="0"
    end
    a.reverse!
  end
  return a
end

def subsets(nums)
  nums.sort!
  len=2**nums.size
  result=Array.new
  len.times do|k|
    state=getStateLine(k,nums.size)
    result[k]=getALineArray(nums,state)
  end
  return result
end


a0=[1,4,3]
p subsets(a0)

