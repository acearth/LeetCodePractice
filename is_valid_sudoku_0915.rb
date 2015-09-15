def is_valid_sudoku(board)
  9.times do |i| 
    return false if not check_line(board[i]) 
    return false if not check_column(board,i)
    return false if not check_block(board,i)
  end
  true
end

def check_block(board, i)
  loc_i, loc_j = (i/3)*3, (i%3)*3
  str=""
  3.times{|i| 3.times {|j| str+=board[loc_i+i][loc_j+j]}}
  check_line(str)
end

def check_column(board,column)
  str=""
  9.times{|i|str+=board[i][column]}
  check_line(str)
end

def check_line(str)
  h=Hash.new{|h,k| h[k]=0}
  9.times {|i| return false if h[str[i]]>0; h[str[i]]+=1 if str[i]!='.'}
  true
end
