def longest_consecutive(nums)
  has=Hash.new
  visited=Hash.new
  nums.each{|n| has[n]=true ; visited[n]=false}
  maxLen=0
  has.each do |key,v|
    len=0
    originKey=key
    while has[key] && !visited[key]
      visited[key]=true
      key+=1
      len+=1
    end
    key=originKey-1
    while has[key] && !visited[key]
      visited[key]=true
      key-=1
      len+=1
    end
    maxLen=len if maxLen<len
  end
  maxLen
end

a=[100, 4, 200, 1, 3, 2]
p longest_consecutive a

