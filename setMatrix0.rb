# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
  l=matrix.size
  c=matrix[0].size
  line0HasZero= matrix[0].include? 0
  column0HasZero=false
  l.times do |i|
    column0HasZero=true if matrix[i][0]==0
  end
  zeroLine=Array.new
  c.times do |i|
    zeroLine.push 0
  end
  l.times do |i|
    matrix[i][0]=0 if matrix[i].include? 0
  end
  for j in 1..c-1 do
    l.times do |i|
      if matrix[i][j]==0
        matrix[0][j]=0
      end
    end
  end
  for i in 1..l-1
    matrix[i]=zeroLine.dup if matrix[i][0]==0
  end
  for j in 1..c-1
    if matrix[0][j]==0
      l.times do |i|
        matrix[i][j]=0
      end
    end
  end
  matrix[0]=zeroLine.dup if line0HasZero
  if column0HasZero
    l.times do |i|
      matrix[i][0]=0
    end
  end
  p matrix
end

m=[[0], [1]]
set_zeroes m
puts
m=[[0, 2, 3], [4, 0, 6]]
set_zeroes m
m=[[0, 1]]
set_zeroes m
m=[[1, 1, 1], [0, 1, 2]]
set_zeroes m
m=[[1,2,3,4],[5,0,5,2],[8,9,2,0],[5,7,2,1]]
set_zeroes m

