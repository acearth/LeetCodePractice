def search(cur,visited,count,n)
  (count[0]+=1; return) if cur==n
  n.times do |i|
    if visited['column'][i]==false &&visited['mainDiag'][cur+i]==false && visited['cntDiag'][cur-i+n]==false
      visited['column'][i]=visited['mainDiag'][cur+i]=visited['cntDiag'][cur-i+n]=true
      search(cur+1,visited,count,n)
      visited['column'][i]=visited['mainDiag'][cur+i]=visited['cntDiag'][cur-i+n]=false
    end
  end
end

def total_n_queens(n)
  visited=Hash.new
  visited['column']=[false]*n
  visited['mainDiag']=[false]*n*2
  visited['cntDiag']=[false]*n*2
  count=[0]
  search(0,visited,count,n)
  count[0]
end


##Warning:: The solution below is very slow.  Recommend to refer above program for you. 
## But it's also helpful for beginners, due to this way show a directly solution for this problem

## proto solution
def total_n_queens_proto(n)
  base=[]
  n.times do
    base.push Array.new(n, 0)
  end
  result=[]
  result[0]=0
  dfs(base, n, -1, 0, result)
  #[result.size, result]
  result[0]
end

def dfs(base, size, lastLine, qc, result)
  return if lastLine>=qc
  if qc==size
    result[0]+=1
  else
    for i in lastLine+1..base.size-1
      base.size.times do |j|
        if base[i][j]==0
          newBase=Array.new
          base.each do |line|
            newBase.push line.dup
          end
          setDanger(newBase, size, i, j)
          newBase[i][j]=1
          dfs(newBase, size, i, qc+1, result)
        end
      end
    end
  end
end

def setDanger(base, size, i, j)
  (i+1..size-1).each { |k| base[k][j]=-1 }
  mainStep=size-[i, j].max-1
  for k in 1..mainStep
    base[i+k][j+k]=-1
  end
  deStep=size-1-i
  deStep=j if i+j<size
  for k in 1..deStep
    base[i+k][j-k]=-1
  end
end

p solve_n_queens(4)
p solve_n_queens(6)
p solve_n_queens(7)
p solve_n_queens(8)
p solve_n_queens(9)
p solve_n_queens(10)
#p solve_n_queens(11)

