# @param {String} s
# @return {Integer}
def length_of_last_word(s)
    words=s.split
    wA=Array.new
    if words.class==wA.class&&words!=nil&&words.size>0
        return words[-1].size
    end
    return 0
    
end
