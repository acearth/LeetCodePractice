def first_bad_version(n)
    is_bad_interval(1,n+1)    
end

def is_bad_interval(left, right)
    return left if left+1==right
    m=left+(right-left)/2
    return m if is_bad_version m and not is_bad_version m-1
    return is_bad_interval(left, m) if is_bad_version m   
    is_bad_interval(m+1, right)
end
