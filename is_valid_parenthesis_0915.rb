def is_valid(s)
  stack, com=[], {}
  com[')']='('
  com[']']='['
  com['}']='{'
  s.chars.each do |ch|
    if com[ch]!=nil
      return false if stack.pop!=com[ch]
    else
      stack.push ch
    end
  end
  stack.size==0
end
