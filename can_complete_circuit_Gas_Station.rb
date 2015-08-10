def can_complete_circuit(gas, cost)
  net,n=[],gas.size
  n.times{|i| net[i]=gas[i]-cost[i]}
  return -1 if net.inject(:+)<0
  getStartPoint(net)
end

def getStartPoint(net)
  n=net.size
  tail=n-1
  start,sum=0,0
  i=0
  while i<tail
    sum+=net[i]
    while sum<0
      start=(start-1)%n
      sum+=net[start]
      tail-=1
    end
    i+=1
  end
  start
end

a=[-1,2,-1]
p getStartPoint(a)


