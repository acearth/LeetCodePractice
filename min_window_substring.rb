def min_window(s, t)
  expected, cur=Hash.new, Hash.new
  t.chars.each { |ch| expected[ch] = expected[ch]==nil ? 1 : (expected[ch]+1); cur[ch]=0 }
  tail, head=0, -1
  result=nil
  loop do
    while head<s.size &&!isFull(cur, expected) ##head moving ahead
      head+=1
      cur[s[head]]+=1 if cur[s[head]]!=nil
    end
    break if !isFull(cur, expected)
    while tail<head
      if cur[s[tail]]==nil
        tail+=1
      elsif cur[s[tail]]>expected[s[tail]]
        cur[s[tail]]-=1
        tail+=1
      else
        break
      end
    end
    if result==nil || head-tail+1<result.size&&head>tail ##set result
      result=s[tail..head]
    end
    ch=s[tail]
    while cur[s[tail]]!=nil && cur[s[tail]]>=expected[s[tail]] #tail moving ahead
      break if s[tail]!=ch
      cur[s[tail]]-=1
      tail+=1
    end
    break if head>=s.size-1
  end
  return "" if result==nil ||result.size<t.size
  result
end

def isFull(cur, expected)
  cur.each_key { |ch| return false if cur[ch]<expected[ch] }
  true
end

s = "ADOBECODEBANC"
t = "ABC"
p min_window(s, t)=="BANC"
s, t='a', 'a'
p min_window(s, t)=="a"
s, t='a', 'aa'
p min_window(s, t)==""
s, t='a', 'b'
p min_window(s, t)==""
s, t="bba", "ab"
p min_window(s, t)=="ba"
puts
s, t="abc", "ab"
p min_window(s, t)=="ab"
s, t="cabwefgewcwaefgcf", "cae"
p min_window(s, t)=='cwae'
s, t="abcabdebac", "cea"
p min_window(s, t)=='ebac'
s,t="adobecodebanc", "abcda"
p min_window(s, t)
