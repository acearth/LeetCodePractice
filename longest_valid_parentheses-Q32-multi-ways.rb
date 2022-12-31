#solved but time is bad.  Need to do it in ONE pass
#
def longest_valid_parentheses(s)
  step=Array.new
  0.upto(s.size-2) { |i| step[i]=2 if s[i..i+1]=="()" }
  max=step.size>0 ? 2:0
  loop do
    changed=false
    i=0
    while i<s.size
      if step[i]!=nil && step[i+step[i]]!=nil
        step[i]+=step[i+step[i]]
        max=step[i] if max<step[i]
        i+=step[i]
        changed=true
      elsif step[i]==nil && step[i+1]!=nil && s[i]=="(" && s[i+step[i+1]+1]==")"
        step[i]=step[i+1]+2
        max=step[i] if max<step[i]
        i-=1 if i>0
        changed=true
      else
        i+=1
      end
    end
    break if !changed
  end
  max
end

# Q-32: two stack, one pass [original]
# 31/dec/2022
# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
  stack = []
  hash = Hash.new { |h, k| h[k] = 0 }
  nstack = []
  s.chars.each_with_index do |ch, i|
    if ch == ')' && stack.any? && stack.last == '('
      stack.pop
      k = nstack.pop
      hash[i] = (k > 0 ? hash[k - 1] : 0) + i - k + 1
    else
      stack << ch
      nstack << i
    end
  end
  hash.values.max || 0
end

# Q-32: DP solution:
# dp[i]: the valid paren counts which ends in str[i]
# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
  dp = [0] + [0] * s.size
  (1...s.size).each do |i|
    next        if s[i]=='('
    if s[i-1]=='('
      dp[i] = (i > 1 ? dp[i-2] : 0) + 2
    elsif i - dp[i-1] > 0 && s[i - dp[i-1] - 1]=='('
      dp[i] = dp[i-1] + (i-dp[i-1] > 1 ? dp[i-dp[i-1]-2] : 0) + 2
    end
  end
  dp.max

end

p longest_valid_parentheses("()(())") == 6
p longest_valid_parentheses(")()())") == 4
p longest_valid_parentheses("") == 0
p longest_valid_parentheses("(()") == 2
