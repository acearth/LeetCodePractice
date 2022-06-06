# year-2015
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

# Q-20: valid parenthesis by stack
# 6/jun/2022
def is_valid(s)
  left, paired, store = ['(', '[', '{'], ['()', '[]', '{}'], []
  s.chars.each do |ch|
    if left.include? ch
      store << ch
    else
      pre = store.pop
      return false unless pre && (paired.include? pre + ch)
    end
  end
  store.empty?
end
