# @param {Integer[][]} grid
# @return {Integer}
def min_path_sum(grid)
  l=grid.size
  c=grid[0].size
  for i in 1..l-1
    grid[i][0]=grid[i-1][0]+grid[i][0]
  end
  for i in 1..c-1
    grid[0][i]=grid[0][i-1]+grid[0][i]
  end
  for i in 1..l-1
    for j in 1..c-1
      grid[i][j]=grid[i][j] + [grid[i-1][j],grid[i][j-1]].min
    end
  end
  grid[-1][-1]
end
