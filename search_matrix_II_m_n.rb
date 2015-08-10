def search_matrix(matrix, target)
  startLine=0
  tailColumn=matrix[0].size
  while startLine<matrix.size&&tailColumn>0
    cur=matrix[startLine][tailColumn-1]
    return true if cur==target
    if cur<target
      startLine+=1
    else
      tailColumn-=1
    end
  end
  return false
end
m=[
  [1,   4,  7, 11, 15],
  [2,   5,  8, 12, 19],
  [3,   6,  9, 16, 22],
  [10, 13, 14, 17, 24],
  [18, 21, 23, 26, 30]
]
p search_matrix(m,5)
p search_matrix(m,20)
