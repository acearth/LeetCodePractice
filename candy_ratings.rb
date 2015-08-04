def candy(ratings)
  return ratings.size if ratings.size<2
  result=c=1
  pre, len=ratings.shift, 1 ## shift: shift out one element
  ratings.each do |n|
    t = n<=>pre
    pre=n
    if t>=0
      if len>1
        len-=1 if c>1
        result-=len*(c-1)
        len=c=1
      end
      c= t==0 ? 1 : (c+1)
    else
      len+=1
      c-=1
    end
    result+=c
  end
  if len>1
    len-=1 if c>1
    result-=len*(c-1)
  end
  result
end

p candy([5, 3, 1])==6
p candy([8, 7, 6, 1, 4, 5, 6])==19
p candy([1, 2, 5, 9, 8, 7, 6, 1, 4, 5, 6])==30
p candy([1, 2, 2])==4
p candy([2, 1])==3

