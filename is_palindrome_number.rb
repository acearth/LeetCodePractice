# Q-9: integer check 
def is_palindrome(x)
    return false if x < 0
    digits = []
    while x !=0
        d = x%10
        digits << d
        x /= 10
    end
    digits==digits.reverse
    
end
