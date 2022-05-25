# @param lines: a 1-d array lines[0] stands for line0's location in column
# @param i: current line number
def search(lines, i, result)
  return @result += 1 if i == lines.size
  lines.size.times do |j|
    lines[i] = j
    if placeable(lines, i, j)
      search(lines, i + 1, result)
    end
    lines[i] = nil
  end
end

# @param j: current column number
def placeable(lines, i, j)
  i.times { |k| return false if [j - k + i, j, j + k - i].include?(lines[k]) }
  true
end

# @note: have to use instance variable "@result" or [0], otherwise the result always be initial value
# @note: we maybe not pass the plain number as reference value??? TODO-confirm
def total_n_queens(n)
  location, @result = [nil] * n, 0
  search(location, 0, @result)
  @result
end