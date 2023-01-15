def preprocess(p)
  pa=p.chars
  repeated=[false]*pa.size
  (3...pa.size).each { |i| repeated[i], repeated[i-1]=true, true if pa[i]=='*' &&pa[i-2]=='*' && pa[i-1]==pa[i-3] }
  pa.each_with_index.map { |ch, i| repeated[i] ? nil : ch }.compact.join
end

def is_match(s, p)
  match(s, preprocess(p))
end

def match(str, p)
  return str=="" if p==""
  return (p.length.even? ? match("", p[2..-1])&&p[1]=='*' : false) if str==""
  return (p[0] == str[0] || p[0]=='.') && match(str[1..-1], p[1..-1]) if p.size==1 || p[1]!='*'
  return true if match(str, p[2..-1]) # means p0 matches null string
  if p[0]=='.'
    str.length.times { |i| return true if match(str[i+1..-1], p[2..-1]) }
  else
    str.length.times do |i|
      break if str[i] != p[0]
      return true if match(str[i+1..-1], p[2..-1])
    end
  end
  false
end

# Q-10: revised on 15/jan/2023
# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
  dp = (1 + s.size).times.map { [false] * (1 + p.size) }
  dp[0][0] = true
  p.size.times { |j| dp[0][j + 1] = j > 0 && p[j] == '*' && dp[0][j - 1] } # check-1: init
  s.chars.each_with_index do |cs, i|
    p.chars.each_with_index do |cp, j|
      if cs == cp || cp == '.'
        dp[i + 1][j + 1] = dp[i][j]
      elsif cp == '*' # check-2: branch condition
        if cs == p[j - 1] || p[j - 1] == '.'
          # check-3: cases: "abd" v. "abc*d" & "abcd" v. "abc*d"
          # Also, "abcc...d" v. "abc*d" is included by dp[i][j+1]
          dp[i + 1][j + 1] = dp[i + 1][j - 1] || dp[i][j + 1]
        else
          dp[i + 1][j + 1] = dp[i + 1][j - 1]
        end
      end
    end
  end
  dp.last.last
end