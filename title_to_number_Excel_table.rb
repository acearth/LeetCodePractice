# recursive method run in 140ms, too slow
def title_to_number(str)
  return 0 if str.length==0
  title_to_number(str[0..-2])*26 + str[-1].ord-64
end
