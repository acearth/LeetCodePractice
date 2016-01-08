def is_palindrome(s)
  s.gsub!(/\W/,'')
  s.downcase==s.reverse.downcase
end
