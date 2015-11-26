def title_to_number(str)
    str=="" ? 0 : title_to_number(str[0..-2])*26 + str[-1].ord-64
end
