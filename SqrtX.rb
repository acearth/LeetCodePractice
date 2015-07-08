def my_sqrt(x)
  l=1
  h=x
  while true
    m=(h+l)/2
    d=x-m*m
    if d==0
      return m
    elsif d>0
      return m if (m+1)*(m+1)>x
      l=m
    else
      h=m
    end
  end
end
