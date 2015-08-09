class Interval
  attr_accessor :start, :end
  def initialize(s=0, e=0)
    @start = s
    @end = e
  end
end

# @param {Interval[]} intervals
# @return {Interval[]}
def merge(intervals)
  result=[]
  intervals.sort_by{|a| a.start}.each do |cur|
    if result.size>0 && cur.start<=result[-1].end
      result[-1].end= cur.end if result[-1].end<cur.end
    else
      result<<cur
    end
  end
  result
end
a=Interval.new(4,7)
b=Interval.new(2,4)
c=Interval.new(2,5)
d=Interval.new(8,9)
s=[a,b,c,d]
require 'pp'
pp merge(s)
