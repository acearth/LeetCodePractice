def reverse(x)
    return -1*reverse(-1*x) if x<0
    res=x.to_s.reverse.to_i  
    res>2**31-1 ? 0 : res
end
