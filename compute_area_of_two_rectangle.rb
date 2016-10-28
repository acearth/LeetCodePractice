def compute_area(a, b, c, d, e, f, g, h)
  return compute_area(e, f, g, h, a, b, c, d) if e < a
  intersect_area = intersect_length(a, c, e, g) * intersect_length(b, d, f, h)
  (c - a) * (d - b) + (g - e) * (h - f) - intersect_area
end

def intersect_length(bottom1, top1, bottom2, top2)
  if bottom1 > bottom2
    intersect_length(bottom2, top2, bottom1, top1)
  elsif top2 < top1
    top2 - bottom2
  else
    [top1 - bottom2, 0].max
  end
end
