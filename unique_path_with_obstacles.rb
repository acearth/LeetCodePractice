# @param {Integer[][]} obstacle_grid
# @return {Integer}
def unique_paths_with_obstacles(obstacle_grid)
  p=[]
  obstacle_grid.size.times {p.push Array.new(obstacle_grid[0].size,0)}
  obstacle_grid.size.times do |i|
    obstacle_grid[0].size.times do |j|
      return 0 if i==0&&j==0 && obstacle_grid[i][j]==1
      p[i][j]=1 if i==0&& j==0
      if i==0&&j>0
        p[i][j]=p[i][j-1] if obstacle_grid[i][j]==0
        p[i][j]=0 if obstacle_grid[i][j]==1
      elsif i>0&&j==0
        p[i][j]=p[i-1][j] if obstacle_grid[i][j]==0
        p[i][j]=0 if obstacle_grid[i][j]==1
      else
        p[i][j]=p[i-1][j]+p[i][j-1]
        p[i][j]=0 if obstacle_grid[i][j]==1
      end
    end
  end
  p
end
a=[
  [0,0,0],
  [0,1,0],
  [0,0,0]
]
p unique_paths_with_obstacles(a)

