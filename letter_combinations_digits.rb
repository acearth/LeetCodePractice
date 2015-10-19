def letter_combinations(digits)
  set=%w[abc def ghi jkl mno pqrs tuv wxyz]
  hash={}
  set.each_with_index { |chs, i| hash[(i+2).to_s]=chs }
  return [] if digits.length<1
  letter_combination_helper(hash, digits)
end

def letter_combination_helper(hash, digits)
  return hash[digits[0]].chars if digits.length==1
  pre=letter_combination_helper(hash, digits[0...-1])
  res=[]
  hash[digits[-1]].chars.each do |ch|
    pre.each { |st| res<<st+ch }
  end
  res
end
