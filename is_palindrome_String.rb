# Q-125
# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  left, right = 0, s.size
  while left < right
    left += 1 while left < right && !(s[left] =~ /[A-Za-z0-9]/)
    right -= 1 while left < right && !(s[right] =~ /[A-Za-z0-9]/)
    if left < right
      return false if s[left].upcase != s[right].upcase
    end
    left, right = left + 1, right - 1
  end
  true
end
