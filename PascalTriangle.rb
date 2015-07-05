# @return {Integer[][]}
def generate(num_rows)
  return [] if num_rows==0
a=Array.new
a[0]=[1]
for i in 1..num_rows-1 do
  a[i]=Array.new
  for j in 0..i do
    if( j==0||j==i)
    a[i][j]=1
    else
      a[i][j]=a[i-1][j-1]+a[i-1][j]
    end
  end
end
return a
end
p generate(0)
p generate(1)
p generate(2)
p generate(3)
p generate(4)

