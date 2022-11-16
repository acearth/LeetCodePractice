# Q-452 EASY greeding
# @param {Integer[][]} points
# @return {Integer}
def find_min_arrow_shots(points)
  arrows = 1
  points = points.sort_by(&:first)
  range = points.shift
  points.each do |start, ending|
    if range.last >= start
      range[0] = [range[0], start].max
      range[1] = [range[1], ending].min
    else
      arrows += 1
      range = [start, ending]
    end
  end
  arrows
end