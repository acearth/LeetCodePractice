# Q-452 EASY greeding
def find_min_arrow_shots(points)
  points.sort_by!(&:first)
  arrow, count = points.fist
  points.each do |p|
    if arrow.first <= p.first && arrow.last >= p.first
      arrow = [[arrow.first, p.first].max, [arrow.last, p.last].min]
    else
      arrow, count = p, count + 1
    end
  end
  count
end