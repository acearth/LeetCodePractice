def is_valid_sudoku(board)
  9.times do |i|
    state=checkLins(board[i])
    return false if state==false
  end
  9.times do |i|
    column=String.new
    9.times do |j|
      column+=board[j][i]
    end
    state=checkLins(column)
    return false if state==false
  end
  9.times do |i|
    state=checkLins(getBlock(board, i))
    return false if state==false
  end
  return true
end

def getBlock(board, i)
  h=(i%3)*3
  c=i-i%3 #line seq
  str=String.new
  3.times do |ki|
    3.times do |kj|
      str+=board[c+ki][kj+h]
    end
  end
  return str
end

def checkLins(str)
  h=Hash.new
  9.times do |i|
    v=str[i]
    if h[v]==nil
      h[v]=1
    else
      h[v]+=1
    end
  end
  h.each do |k, v|
    if k!='.'&&v>1
      return false
    end
  end
  return true
end

bb=[".87654321", "2........", "3........", "4........", "5........", "6........", "7........", "8........", "9........"]

p is_valid_sudoku bb

=begin
... .5. .1.
.4. 3.. ...
... ..3 ..1

8.. ... .2.
..2 .7. ...
.15 ... ...

... ..2 ...
.2. 9.. ...
..4 ... ...
=end
bb=["....5..1.", ".4.3.....", ".....3..1", "8......2.", "..2.7....", ".15......", ".....2...", ".2.9.....", "..4......"]
p is_valid_sudoku bb

