# Q-474: 0-1 pack with 2-d values
def find_max_form(strs, m, n)
  dp=(1+m).times.map{|_| [0]*(1+n)}
  strs.each do | str|
    zero, one = str.count('0'), str.count('1')
    m.downto(zero) do |i|
      n.downto(one) do |j|
        dp[i][j]=[dp[i][j],dp[i-zero][j-one]+1].max
      end
    end
  end
  dp[m][n]
end
