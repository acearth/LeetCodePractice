class Interval
  attr_accessor :start, :end
  def initialize(s=0, e=0)
    @start = s
    @end = e
  end
end

def merge(intervals)
  return [] if intervals.empty?
  intervals.sort_by! { |i| i.start }
  reduced = [intervals[0]]
  1.upto(intervals.size - 1) do |i|
    if intervals[i].start <= reduced[-1].end
      reduced[-1].end = [intervals[i].end, reduced[-1].end].max
    else
      reduced << intervals[i]
    end
  end
  reduced
end
