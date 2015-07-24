# @param {Integer} n
# @return {String}
def count_and_say(n)
  base='1'
  (n-1).times do
    base=parse(base)
  end
  base
end

def parse(str)
  return "" if str.size<1
  c=0
  str.length.times do |i|
    c+=1 if str[i]==str[0]
    break if str[i]!=str[0]
  end
  return c.to_s+str[0]+parse(str[c..-1])
end

p parse ('1')
p parse ('123')
p parse('1122233312') =='2132331112'

p count_and_say 3
