def exist(board, word)
  return true if word.length>500
  v=[]
  result=[]
  board.size.times { v.push Array.new(board[0].size, 0) }
  board.size.times do |i|
    board[0].size.times do |j|
      dfs(board, v, i, j, word[1..-1], result) if word[0]==board[i][j]
    end
  end
  result.size>0
end


def dfs(board, v, i, j, word, result)
  if word.size==0
    result.push true
  else
    vv=[]
    v.each { |line| vv.push line.dup }
    vv[i][j]=1
    st=[[-1, 0], [0, -1], [0, 1], [1, 0]]
    st.each do |ki, kj|
      if (0..vv.size-1).include?(i+ki) && (0..vv[0].size-1).include?(j+kj)
        dfs(board, vv, i+ki, j+kj, word[1..-1], result) if board[i+ki][j+kj]==word[0] && vv[i+ki][j+kj]==0
      end
    end
  end
end

