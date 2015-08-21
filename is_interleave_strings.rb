def is_interleave(s1,s2,s3)
  nextResult=[[0,"",0,""]]
  s3.chars.each do |ch|
    result,nextResult=nextResult,[]
    result.each do |group|
      if s1[group[0]]==ch
        dupGroup=group.dup
        dupGroup[0]+=1
        dupGroup[1]+=ch
        nextResult<<dupGroup
      end
      if s2[group[2]]==ch
        dupGroup=group.dup
        dupGroup[2]+=1
        dupGroup[3]+=ch
        nextResult<<dupGroup
      end
    end
    break if nextResult.size==0
  end
  return nextResult.size>0
end
s1 = "aabcc"
s2 = "dbbca"
s3 = "aadbbcbcac"
p is_interleave(s1,s2,s3)
s3 = "aadbbbaccc"
p is_interleave(s1,s2,s3)



