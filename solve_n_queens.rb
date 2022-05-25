# @param lines: a 1-d array lines[0] stands for line0's location in column
# @param i: current line number
def search(lines, i, result)
  return result << [] + lines if i == lines.size
  lines.size.times do |j|
    lines[i] = j
    search(lines, i + 1, result) if placeable(lines, i, j)
    lines[i] = nil
  end
end

# @param j: current column number
def placeable(lines, i, j)
  i.times { |k| return false if [j - k + i, j, j + k - i].include?(lines[k]) }
  true
end

def solve_n_queens(n)
  location, result = [nil] * n, []
  search(location, 0, result)
  result.map do |line|
    line.map { |col| "." * col + "Q" + "." * (n - col - 1) }
  end
end