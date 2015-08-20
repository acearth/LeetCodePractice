def length_of_last_word(s)
    return 0 if s.split[-1]==nil
    s.split[-1].length   
end
