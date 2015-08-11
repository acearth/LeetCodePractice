def partition(s)
  result=[[s[0]]]
  s[1..-1].chars.each do |ch|
    result.each do |part|
      part<<ch
      tmp1=part[-1]+ch
      if tmp1.reverse==tmp1
        dupPart=part.dup
        dupPart[-1]=tmp1
        result<<dupPart
      end
      if part.size>1
        tmp2=part[-2]+tmp1
        if tmp2.reverse==tmp2
          dupPart=part[0..-2].dup
          dupPart<<tmp2
          result<<dupPart
        end
      end
    end
  end
  result
end
s='aab'
p partition(s)
p partition('efe')

