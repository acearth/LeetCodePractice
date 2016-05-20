def is_isomorphic(s, t, maps = {}, mapt = {})
  t.chars.each_with_index.map { |ch, i| mapt[ch] ||= s[i] }.join == s &&
    s.chars.each_with_index.map { |ch, i| maps[ch] ||= t[i] }.join == t
end
