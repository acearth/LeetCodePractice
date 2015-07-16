def dfs(h,str,tmpStr,result)
  if str.size<1
    result.push tmpStr
    return result
  end
  ch=str[0]
  h[ch].size.times do |i|
    dfs(h,str[1..-1],tmpStr+h[ch][i],result)
  end
end
def letter_combinations(digits)
  result=Array.new
  if digits.size<1
    return []
  end
  h=Hash.new
  h['2']='abc'
  h['3']='def'
  h['4']='ghi'
  h['5']='jkl'
  h['6']='mno'
  h['7']='pqrs'
  h['8']='tuv'
  h['9']='wxyz'
  h['1']='1'
  h['0']='0'
  dfs(h,digits,String.new,result)
  result.compact
end
p ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]==letter_combinations("23")
