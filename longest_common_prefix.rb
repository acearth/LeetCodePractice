def longest_common_prefix(strs)
  prefix = strs[0]
  strs.each do |str|
    prefix.size.times do |i|
      (prefix= prefix[0...i]; break) if prefix[i] != str[i]
    end
  end
  prefix ||= ""
end
