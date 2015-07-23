def solve_n_queens(n)
  base=[]
  n.times do
    base.push Array.new(n, 0)
  end
  result=[]
  dfs(base, n, -1, 0, result)
  #[result.size, result]
  result
end

def dfs(base, size, lastLine, qc, result)
  return if lastLine>=qc
  if qc==size
    t=""
    size.times do
      t+='.'
    end
    size.times do |i|
      k=base[i].index(1)
      tt=t.dup
      tt[k]='Q'
      base[i]=tt
    end
    result.push base
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
p solve_n_queens(5)
p solve_n_queens(6)
p solve_n_queens(7)
p solve_n_queens(8)
p solve_n_queens(9)
p solve_n_queens(10)
p solve_n_queens(11)
p solve_n_queens(12)

