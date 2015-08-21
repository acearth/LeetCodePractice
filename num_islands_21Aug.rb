def dfs(grid,i,j)
  grid[i][j]='0'
  dfs(grid,i+1,j) if grid[i+1]!=nil && grid[i+1][j].to_s=='1'
  dfs(grid,i,j+1) if grid[i][j+1]!=nil && grid[i][j+1].to_s=='1'
  dfs(grid,i-1,j) if i>0 && grid[i-1][j].to_s=='1'
  dfs(grid,i,j-1) if j>0 && grid[i][j-1].to_s=='1'
end

def num_islands(grid)
  num=0
  grid.size.times do |i|
    grid[0].size.times do |j|
      (dfs(grid,i,j); num+=1) if grid[i][j]=='1'
    end
  end
  num
end
