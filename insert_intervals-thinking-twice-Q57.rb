# Q-57: insert intervals: hard for handle directly, time-consuming
# 30/dec/2022
# @param {Integer[][]} intervals
# @param {Integer[]} new_interval
# @return {Integer[][]}
def insert(intervals, to_add)
  len = intervals.size
  cur = bsearch(intervals, to_add) - 1 # shift once for b-search
  result = cur > 0 ? intervals[0...cur] : []
  if cur >= 0 && intervals[cur][1] >= to_add[0]
    start = cur
    to_add[0] = [intervals[cur][0], to_add[0]].min
  else
    result << intervals[cur] if cur >= 0
    start = [cur, 0].max # ensure starts from 0
  end
  while start < len && intervals[start][0] <= to_add[1]
    to_add[1] = [to_add[1], intervals[start][1]].max
    start += 1
  end
  result + [to_add] + (start < len ? intervals[start..] : [])
end

def bsearch(intervals, to_add)
  l, r = 0, intervals.size
  while l < r
    m = (l + r) / 2
    return m if intervals[m][0] == to_add[0]
    if intervals[m][0] > to_add[0]
      r = m
    else
      l = m + 1
    end
  end
  l
end

p insert([[1, 5]], [0, 3])
p insert([[1, 5]], [1, 7]) == [[1, 7]]
p insert([[1, 5]], [2, 3]) == [[1, 5]]
p insert([], [1, 5]) == [[1, 5]]
p insert([[1, 5]], [5, 7]) == [[1, 7]]
p insert([[0, 0], [1, 3], [6, 9]], [2, 5])
p insert([[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]], [4, 8]).size == 3