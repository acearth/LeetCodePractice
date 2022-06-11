# Q-56 Merge intervals

def merge(intervals)
  intervals.sort_by!(&:first)
  result = [intervals.first]
  intervals.each do |interval|
    if result.last.last >= interval.first
      cur = result.last
    else
      result << cur = interval
    end
    cur[-1] = [cur.last, interval.last].max
  end
  result
end