# delete in place with TLE
# should avoid to sort
#  solve it without sort

def insert(intervals, new_interval)
  result=[]
  intervals.each do |cur|
    if cur.start<=new_interval.start && cur.end>=new_interval.start
      new_interval.start=cur.start
      new_interval.end=[cur.end,new_interval.end].max
    elsif cur.start<=new_interval.end && cur.end>new_interval.end
      new_interval.end=cur.end
      new_interval.start=[cur.start,new_interval.start].min
    elsif cur.start>new_interval.end || cur.end<new_interval.start
      result<<cur
    end
  end
  return [new_interval] if result.size==0
  return [new_interval]+result if new_interval.end<result[0].start
  index=result.size-1
  result.each_with_index {|cur,i| (index=i;break) if cur.start>new_interval.start}
  result[0..index-1]+[new_interval]+result[index..-1]
end
