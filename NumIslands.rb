def dfs(grid,i,j)
  grid[i][j]='0'
  hn=grid.size
  vn=grid[i].size
  dfs(grid,i+1,j) if i+1<hn&&grid[i+1][j].to_s=='1'
  dfs(grid,i,j+1) if j+1<vn&&grid[i][j+1].to_s=='1'
  dfs(grid,i-1,j) if i-1>=0&&grid[i-1][j].to_s=='1'
  dfs(grid,i,j-1) if j-1>=0&&grid[i][j-1].to_s=='1'
end

def num_islands(grid)
  num=0
  return num if grid.size<1
  hn=grid.size
  vn=grid[0].size
  hn.times do |i|
    vn.times do |j|
      if grid[i][j]=='1'
        dfs(grid,i,j)
        num+=1
      end
    end
  end
  return num
end
