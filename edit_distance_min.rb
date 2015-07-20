def min_distance(word1, word2)
  return word1.length if word2.length==0
  return word2.length if word1.length==0
  state=Array.new
  state[0]=Array.new
  (word2.length+1).times do |i|
    state[0].push i
  end
  for i in 1..word1.length do
    state.push Array.new
    state[i][0]=i
  end
  word1.length.times do |i|
    word2.length.times do |j|
      state[i+1][j+1] = word1[i]==word2[j] ? state[i][j] : [state[i][j+1], state[i+1][j], state[i][j]].min+1
    end
  end
  state[-1][-1]
end

p min_distance "ab", "bc"
p min_distance "b", "c"

