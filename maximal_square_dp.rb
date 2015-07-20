def maximal_square(matrix)
  return 0 if matrix.size==0
  hash=Hash.new
  tmp=Array.new
  for i in 0..matrix.size-1
    for j in 0..matrix[0].size-1
      tmp.push [i,j] if matrix[i][j]=="1"
    end
  end
  hash[1]=tmp.dup ## TEST
  return 0 if tmp.size==0
  len=1
  while len<=matrix.size ## WARNING: len is older length.
    tmp.clear
    hash[len].each do |i,j|
      if i+len<matrix.size&&j+len<matrix[0].size
        t=0
        (len+1).times do |k|
          t+=matrix[i+len][j+k].to_i
          t+=matrix[i+k][j+len].to_i
        end
        tmp.push [i,j] if t==(len+1)*2
      end
    end
    break if tmp.size==0
    len+=1
    hash[len]=tmp.dup
  end
  len*len
end

a1=["00","00"]
p maximal_square a1
a1=["01","10"]
p maximal_square a1
a1=["1010","1011","1011","1111"]
p maximal_square a1
a1=["01"]
p maximal_square a1
a1=["1101","1101","1111"]
p maximal_square a1

