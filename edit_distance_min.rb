def min_distance(word1, word2)
  step = (0..word2.length).to_a
  word1.length.times do |i|
    pre, step[0] = step[0], i + 1
    word2.length.times do |j|
      current = step[j + 1]
      step[j + 1] = word1[i] == word2[j] ? pre : 1 + [pre, current, step[j]].min
      pre = current
    end
  end
  step.last
end
