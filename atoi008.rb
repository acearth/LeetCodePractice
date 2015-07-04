def my_atoi(str)
    if str.length==0
        return 0
    end
    value=str.to_i
    if(value>2**31-1)
        return 2**31-1
    end
    
    if(value<(-1)*2**31)
        return -1*2**31
    end
    return value
    
end
