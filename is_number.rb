# @param {String} s
# @return {Boolean}
def is_number(s)
    return true if /^(\+|-)?(\d+(\.\d+)?|\d+\.|\.\d+)(e(\+|-)?\d+)?$/=~s.strip
    false    
end
