def generate_matrix(n)
  return [] if n==0
  a=[[]]
  k=n+1
  (0..n-1).each{|i| a[0][i]=i+1}
  (1..n-1).each {|i| a[i]=[];a[i][n-1]=k;k+=1}
  (n-2).downto(0).each {|i| a[n-1][i]=k;k+=1}
  si,ti,k,direction=n-1,0,k,3
  while k<=n*n
    si,ti,k,direction=fixLine(a,si,ti,k,direction)
  end
  a
end

def fixLine(arr,si,ti,k,direction)
  step=direction>1? -1:1
  ti+=step if direction.even?
  si+=step if direction.odd?
  while arr[si][ti]==nil
    arr[si][ti]=k
    k+=1
    ti+=step if direction.even?
    si+=step if direction.odd?
  end
  ti-=step if direction.even?
  si-=step if direction.odd?
  direction+=1
  direction=0 if direction==4
  return si,ti,k,direction
end


