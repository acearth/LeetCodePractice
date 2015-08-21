require 'pp'

def getPossibleNumber(board,curI,curJ)
  candidate=[nil,1,2,3,4,5,6,7,8,9]
  board[curI].each{|n| candidate[n]=nil }
  board.each{|line| candidate[line[curJ]] = nil  }
  unitStartI=(curI/3)*3
  unitStartJ=(curJ/3)*3
  3.time do |i|
    3.times do |j|
      target=board[unitStartI+i][unitStartJ+j]
      candidate[target]=nil
    end
  end
  candidate.compact
end
def getNextLocation(board)
  9.times{|i| 9.times{|j| return i,j if board[i][j]=='.'}}
  false
end

def solve_sudoku(board)
  loop do 
    return if !getNextLocation
    curI,curJ=getNextLocation(board)
    prob=getPossibleNumber(board,curI,curJ)
    if prob.size==1
      board[curI][curJ]=prob[0]
      curJ=curJ+1
      curI,curJ=curI+1,curJ%9 if curJ==9
    end
    newRes=checkNeighbourBlock(board,(curI/3)*3,(curJ/3)*3) ## block start location=curI/3*3 
    if newRes
  end
end

def checkNeighbourBlock(board,bsi,bsj)
  absent=['1','2','3','4','5','6','7','8','9']
  3.times{|i| 3.times{|j| absent.delete(board[i][j]) if board[i][j]!='.' } }
  absent.each do |ch|
    pLine=pColumn=[0,1,2]
    2.times do |i| ##check column block
      nsi = (bsi+i)%3
      3.times{|ni| 3.times{|nj|
        pColumn.delete(nj) if board[nsi*3+ni][bsj+nj]==ch 
      }}
    end
    2.times do |j| ##check line block
      nsj = (bsj+j)%3
      3.times{|ni| 3.times{|nj|
        pLine.delete(ni) if board[bsi+ni][nsj*3+nj]==ch 
      }}
    end
    return [ch,pLine[0]+bsi*3,pColumn[0]+bsj*3] if pLine.size==pColumn.size==1
  end
  false
end

b=["..9748...","7........",".2.1.9...","..7...24.",".64.1.59.",".98...3..","...8.3.2.","........6","...2759.."]
solve_sudoku(b)


