# bfs
def jump(nums)
  dest=nums.size-1
  visited, q=[], []
  map=[]
  nums.each_with_index { |n, i| map[i]=[i, n, -1]; visited[i]=false }
  q.push map[0]
  while q.size>0
    cur, stepSize, curStep = q.shift
    return map[dest][2]+1 if cur==dest
    map[cur][2]=curStep+1
    (stepSize).downto(1) do |i|
      nexti=cur+i
      if !visited[nexti]&& map[nexti]!=nil
        map[nexti][2]= map[cur][2]
        return map[dest][2]+1 if nexti==dest
        q<< map[nexti]
        visited[nexti]=true
      end
    end
  end
end
a=[2,3,1,1,4]
p jump(a)

#greedy method needs to learn .
