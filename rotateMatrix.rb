def rotate(matrix)
  if matrix.size>1
    n=matrix.size-1
    it=matrix.size/2
    it.times do |i|
      it.times do |j|
        swap(matrix, i, j)
      end
    end
    if matrix.size%2==1
      it.times do |i|
        swap(matrix, i, it)
      end
    end
  end
  return
end

def swap(m, x, y)
  n=m.size-1
  t0=m[x][y]
  t1=m[y][n-x]
  t2=m[n-x][n-y]
  t3=m[n-y][x]
  m[x][y]=t3
  m[y][n-x]=t0
  m[n-x][n-y]=t1
  m[n-y][x]=t2
end

a=[[1, 2], [3, 4]]
rotate a
p a

a=[[1, 2, 3], [4, 5, 6], [7, 8, 9]]
rotate a
p a
a=[[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]
rotate a
p a



