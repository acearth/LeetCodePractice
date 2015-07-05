def search_matrix(matrix, target)
  rowCnt=matrix.size
  row0=Array.new
  rowCnt.times do |i|
    row0[i]=matrix[i][0]
  end
  rowIndex=findRow(row0, 0, row0.length, target)
  result=findTarget(matrix[rowIndex], 0, matrix[rowIndex].length, target)
  return result
end

def findTarget(row, l, h, target)
  m=(h+l)/2
  if (target<row[l])
    return false
  elsif target>row[h-1]
    return false
  elsif target==row[m]
    return true
  elsif target>row[m] && target<row[m+1]
    return false
  elsif target<row[m] && target>row[m-1]
    return false
  elsif target>row[m]
    return findTarget(row, m+1, h, target)
  elsif target<row[m]
    return findTarget(row, l, m, target)
  end
end

def findRow(row0, l, h, target)
  if h-l==1
    return l
  end
  m=(l+h)/2
  if row0[m]==target
    return m
  elsif target>row0[m]
    if m+1==h
      return m
    elsif target<row0[m+1]
      return m
    else
      return findRow(row0, m+1, h, target)
    end
  elsif target<row0[m]
    if target>row0[m-1]
      return m-1
    else
      return findRow(row0, l, m, target)
    end
  end
end


am=[[1, 2, 3], [4, 5, 6]]
# am=[[0]]


p search_matrix(am, 1)
a1=[[3], [4]]

p search_matrix(a1, 5)
a2=[[1, 3, 5]]

p search_matrix(a2, 5)
a3=[[1,3,5,7],[10,11,16,20],[23,30,34,50]]
p search_matrix(a3,3)



