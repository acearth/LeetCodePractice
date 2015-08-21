def find_substring(s, words)
  arr=[]
  words=words.sort
  (s.size-words[0].size+1).times{|i| arr[i]=s[i..i+words[0].size-1] }
  result=[]
  (s.size-words.size*words[0].size+1).times do |i|
    tmpArr=[]
    words.size.times{|j| tmpArr<<arr[i+j*words[0].size]}
    result<<i if tmpArr.sort == words
  end
  result
end

s = "barfoothefoobarman"
words = ["foo", "bar"]
p find_substring(s, words) #==>[0,9]

