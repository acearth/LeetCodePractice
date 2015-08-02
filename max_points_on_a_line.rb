def max_points(points)
  return points.size if points.size<2
  dupCount=Hash.new
  points.each { |p| dupCount[[p.x, p.y]] = dupCount[[p.x, p.y]]==nil ? 1 : (dupCount[[p.x, p.y]]+1) }
  hash=Hash.new
  points.size.times do |i|
    (i+1..points.size-1).each do |j|
      x1, y1=points[i].x, points[i].y
      x2, y2=points[j].x, points[j].y
      if x1==x2
        hash[[1, 0, x1]]=[] if hash[[1, 0, x1]]==nil
        hash[[1, 0, x1]].push([x1, y1]).push([x2, y2])
      else
        k=(y2-y1)*1.0/(x2-x1) ##NOTICE: k=5/2 is same as 4/2, so it must be cast to float
        b=k*x2-y2
        hash[[k, -1, b]]=[] if hash[[k, -1, b]]==nil
        hash[[k, -1, b]].push([x1, y1]).push([x2, y2])
      end
    end
  end
  max=0
  hash.each_value do |v|
    count=0
    v.uniq!
    v.each { |p| count+=dupCount[[p[0], p[1]]] }
    max=count if max<count
  end
  max
end

class Point
  attr_accessor :x, :y

  def initialize(x=0, y=0)
    @x = x
    @y = y
  end

end

p=[Point.new(0, 0)]*2
p max_points(p)==2

p1=Point.new(0, 0)
p2=Point.new(-1, -1)
p3=Point.new(2, 2)
p max_points([p1, p2, p3])==3

p4, p5=Point.new(3, 10), Point.new(0, 2)
p7, p6=Point.new(3, 10), Point.new(0, 2)
p max_points([p4, p5, p6, p7])==4



