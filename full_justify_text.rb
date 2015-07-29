def full_justify(words, max_width)
  return [] if words.size<1
  lines=[]
  line=[]
  curLen=0
  words.each do |w|
    if curLen==0
      line<<w
      curLen=w.length
    elsif curLen+1+w.length<=max_width
      curLen+=w.length+1
      line<<w
    else
      lines<<addSpace(line.dup, max_width)
      line.clear
      line<<w
      curLen=w.length
    end
  end
  (line.size-1).times { |i| line[i]+=' ' }
  line=line.join
  while line.length<max_width
    line+=" "
  end
  lines<<line
end


def addSpace(line, max_len)
  if line.size==1
    while line[0].size<max_len
      line[0]+=" "
    end
    return line[0]
  end
  len=0
  line.each { |w| len+=w.length }
  spaceCount=line.size-1
  longSpace=""
  ((max_len-len)/spaceCount).times do
    longSpace+=" "
  end
  remain=max_len-len-(max_len-len)/spaceCount*spaceCount
  (line.size-1).times { |i| line[i]+=longSpace }
  i=0
  remain.times { line[i]=line[i]+' ';i+=1 }
  line.join
end


w=["This", "is", "an", "example", "of", "text", "justification."]
p full_justify w, 16

w=[""]
p full_justify w, 0

w=["a", "b", "c", "d", "e"]
p full_justify w, 1
p full_justify(["Listen", "to", "many,", "speak", "to", "a", "few."], 6)
p full_justify(["Here","is","an","example","of","text","justification."], 16)

