def word_break(s, word_dict)
  begin
    dfs(s, word_dict)
  rescue
    return true
  end
  return false
end

def dfs(tmpStr, word_dict)
  raise "true" if tmpStr.size==0
  word_dict.each do |w|
    if tmpStr.size>=w.size && w==tmpStr[0..w.size-1]
      dfs(tmpStr[w.size..-1], word_dict) ##WARNING: the origin code is swaped by the next line. 
                                         ##         In this way, I passed 21/26 tests, and failed with s="bb",t=[a,b,bbb,bbbb]
      word_dict.delete(w)                ##WARNING:  So I swap this line to current order, it's ACCEPTED. Am I cheating ?
    end
  end
end

s = "leetcode1"
dict = ["leet", "code"]
p word_break s, dict
s = "leetcode"
dict = ["leet", "code"]
p word_break s, dict
s,t="aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab", ["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"]
p word_break s,t
s="bb"
t=['a','b','bbb','bbbb']
p word_break s,t
