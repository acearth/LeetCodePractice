def spiral_order(matrix)
  return [] if matrix.size<1
  m=matrix.size
  n=matrix[0].size
  result=[]
  v=[[]]
  v[0]=[]
  k=0
  (0..n-1).each { |i| result.push matrix[0][i]; v[0][i]=1; k+=1 }
  (1..m-1).each { |i| v[i]=Array.new(n, 0); v[i][n-1]=1; result.push matrix[i][n-1]; k+=1 }
  if m>1
    (n-2).downto(0).each { |i| result.push matrix[m-1][i]; v[m-1][i]=1; k+=1 }
  end
  si, ti, k, direction=m-1, 0, k, 3
  while k<m*n
    si, ti, k, direction=getElement(matrix, v, result, si, ti, k, direction)
  end
  result
end

def getElement(matrix, v, result, si, ti, k, direction)
  step=direction>1 ? -1 : 1
  ti+=step if direction.even?
  si+=step if direction.odd?
  while v[si][ti]==0
    v[si][ti]=1
    result.push matrix[si][ti]
    k+=1
    ti+=step if direction.even?
    si+=step if direction.odd?
  end
  ti-=step if direction.even?
  si-=step if direction.odd?
  direction+=1
  direction=0 if direction==4
  return si, ti, k, direction
end

ar=[[1, 2], [3, 4]]
p spiral_order(ar)
ar=[[1, 2, 3], [4, 5, 6], [7, 8, 9]]
p spiral_order(ar)

ar=[[1, 2]]
p spiral_order(ar)
ar=[[2,5],[8,4],[0,-1]]
p spiral_order(ar)

