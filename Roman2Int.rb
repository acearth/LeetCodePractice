def roman_to_int(s)
  a=Hash.new
  a["I"]=1.to_i
  a["V"]=5.to_i
  a["X"]=10.to_i
  a["L"]=50.to_i
  a["C"]=100.to_i
  a["D"]=500.to_i
  a["M"]=1000.to_i
  return a[s] if s.length==1
  return 0 if s.length==0
  ka=getMaxIndex(s)
  ch=ka[0]
  k=ka[1]
  if k== -1
    return -1
  end
  if k==0
    sl=[]
  else
    sl=s[0..k-1]
  end

  sr=s[k+1..s.length-1]
  resultLeft=roman_to_int(sl)
  resultRight=roman_to_int(sr)
  return a[ch]+resultRight-resultLeft
end

def getMaxIndex(s)
  if s.index("M")!=nil
    return ["M", s.index("M")]
  elsif s.index("D")!=nil
    return ["D", s.index("D")]
  elsif s.index("C")!=nil
    return ["C", s.index("C")]
  elsif s.index("L")!=nil
    return ["L", s.index("L")]
  elsif s.index("X")!=nil
    return ["X", s.index("X")]
  elsif s.index("V")!=nil
    return ["V", s.index("V")]
  elsif s.index("I")!=nil
    return ["I", s.index("I")]
  else
    return ["Z", -1]
  end
end

p roman_to_int("IX")
p roman_to_int("XCV")
p roman_to_int("DCXXI")
p roman_to_int("LIIL")
