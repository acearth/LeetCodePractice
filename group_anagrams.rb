def group_anagrams(strs)
  strs.group_by{|str| str.chars.sort}.values.map(&:sort)    
end
