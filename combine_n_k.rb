def combine(n, k)
  endState =[]
  (n).downto(n-k+1).each { |w| endState.unshift w }
  start=[]
  (1..k).each { |w| start.push w }
  result=[start.dup]
  while start!=endState
    cur=k-1
    while start[cur]==endState[cur]
      cur-=1
    end
    start[cur]+=1
    (cur+1..k-1).each{|i| start[i]=start[i-1]+1}
    result.push start.dup
    cur=k-1
  end
  return result.size,result
end

p combine 4, 2
p combine 5, 3

