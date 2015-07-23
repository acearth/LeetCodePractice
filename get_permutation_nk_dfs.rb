def get_permutation(n,k)
  base=[]
  n.times do |i|
    base.push i+1
  end
  fact=[]
  for i in 1..9 do 
    fact[i]=base[0..i-1].inject(:*)
  end
  dfs(fact,base,"",n,k-1)
end

def dfs(fact,base,tmp,size,seq)
  return tmp+base[0].to_s if base.size<2
  cur=seq/fact[base.size-1]
  tmp+=base[cur].to_s
  base-=[base[cur]]
  dfs(fact,base,tmp,size,seq-cur*fact[base.size])
end
p get_permutation(3,1)
p get_permutation(3,2)
p get_permutation(3,3)
p get_permutation(3,4)
p get_permutation(3,5)
p get_permutation(3,6)

