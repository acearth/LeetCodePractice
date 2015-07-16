# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  result=Array.new
  dfs(0,n*2,"",result)
  result
end

def dfs(state,resource,tmpStr,result)
  return if state<0
  if resource==0
    result.push tmpStr if state==0
    return
  end
  if resource>0
      dfs(state-1,resource-1,tmpStr+")",result)
      dfs(state+1,resource-1,tmpStr+"(",result)
  end
end

p generate_parenthesis(1)
p generate_parenthesis(2)
p generate_parenthesis(3)



