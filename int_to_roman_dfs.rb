def int_to_roman(num)
  dfs(num,"")
end
def dfs(val,tmpStr)
  case val
  when 1000..3999 then dfs(val-1000,tmpStr+'M')
  when 900..999 then dfs(val-900,tmpStr+'CM')
  when 500..899 then dfs(val-500,tmpStr+'D')
  when 400..499 then dfs(val-400,tmpStr+'CD')
  when 100..399 then dfs(val-100,tmpStr+'C')
  when 90..99 then dfs(val-90,tmpStr+'XC')
  when 50..89 then dfs(val-50,tmpStr+'L')
  when 40..49 then dfs(val-40,tmpStr+'XL')
  when 10..39 then dfs(val-10,tmpStr+'X')
  when 9 then return tmpStr+'IX'
  when 5..8 then dfs(val-5,tmpStr+'V')
  when 4 then return tmpStr+'IV'
  when 1..3 then dfs(val-1,tmpStr+'I') 
  when 0  then tmpStr
  end
end

p int_to_roman 1
p int_to_roman 1999
p int_to_roman 1880

