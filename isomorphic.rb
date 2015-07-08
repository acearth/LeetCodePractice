def getForm(str)
  #str=str.upcase
  form=Array.new
  ma=Hash.new

  vc=0
  str.length.times do |i|
    ki=ma[str[i]]
    if ki!=nil
      form.push ki
    else
      vc+=1
      ma[str[i]]=vc
      form.push ma[str[i]]
    end
  end
  return form
end
def is_isomorphic(s, t)
  return getForm(s)==getForm(t)
end
