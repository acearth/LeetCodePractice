
def getInt(ch)
  return ch.ord-64
end

def lineNumber(str)
  len=str.length
  value=0
  len.times do|i|
    ch=str[i]
    base=str[i].ord-64
    exp=len-1-i
    value+=base*(26**exp)
  end
  return value
end


p lineNumber("ABC")

