def generate(num_rows)
  result=[]
  return result if num_rows==0
  result[0]=[1]
  1.upto(num_rows-1) do |i|
    result[i]=[]
    (i+1).times do |j|
      result[i][j]= (j==0||j==i) ? 1 : (result[i-1][j-1]+result[i-1][j])
    end
  end
  result
end
