def single_number(nums)
  a=Hash.new
  for element in nums do
    if a[element]==nil
      a[element]="one"
    else
      a[element]="two"
    end
  end
  v=-88
  for key in a.keys do
    if a[key]=="one"
      v=key
      break
    end
  end
  return v
end

nu=[1,2,3,2]
k=single_number(nu)
p k

