# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @param {Integer} d
# @param {Integer} e
# @param {Integer} f
# @param {Integer} g
# @param {Integer} h
# @return {Integer}
def compute_area(a, b, c, d, e, f, g, h)
  l1=(a-c).abs
  h1=(b-d).abs
  s1=l1*h1

  l2=(e-g).abs
  h2=(f-h).abs
  s2=l2*h2

  lj=getJointLength(a,c,e,g)
  hj=getJointLength(b,d,f,h)
  sd=lj*hj
  return s1+s2-sd
    
end

def getJointLength(a,b,c,d)
  if a<c&&b<d
    return (d-a).abs
  elsif a<c && b>d
    return (c-d).abs
  elsif a<c && b<c
    return 0
  end

  if c<a&&d<b
    return (b-c).abs
  elsif c<a&&d<a
    return 0
  elsif a<c&&b<d
  end
end

