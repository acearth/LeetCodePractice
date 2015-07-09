# @param {Integer} n, a positive integer
# @return {Integer}
def reverse_bits(n)
    s=n.to_s(2)
    s=s.to_s
    s.reverse!
    (32-s.length).times do 
        s+="0"
    end
    s="0b"+s
    return Integer(s)
    
end
