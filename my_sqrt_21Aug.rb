def my_sqrt(x)
  l,h=1,x    # l must be 1. If x<1, h would be 1.
  loop do 
    t=(l+h)/2
    diff=x-t*t
    return t if diff==0 || (diff>0 && (t+1)*(t+1)>x)
    diff>0 ? (l=t) : (h=t)
  end
end

p my_sqrt 10
