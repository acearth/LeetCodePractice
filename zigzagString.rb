def getNextPosition(num_rows)
  d=num_rows-1
  column=0
  line=0
  lambda do
    if column%d==0&&line<d
      line+=1
    else
      column+=1
      line-=1
      line=0 if column%d==0
    end
    return line, column
  end
end

def convert(s, num_rows)
  return s if num_rows<2
  res=Array.new
  num_rows.times do
    res.push Array.new
  end
  location=getNextPosition(num_rows)
  i,j=0,0
  s.length.times do |si|
    res[i][j]=s[si]
    i, j=location.call
  end
res.flatten.compact.join
end
p convert("PAYPALISHIRING", 3)
