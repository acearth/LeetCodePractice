def is_valid(s)
  hash=[  ['(',')'],
          ['[',']'],
          ['{','}']   ].to_h
  stack=[]
  s.chars.each do |ch|
    stack<<ch
    next if stack.size<2
    (stack.pop;stack.pop) if hash[stack[-2]]==stack[-1]
  end
  stack.size==0
end
