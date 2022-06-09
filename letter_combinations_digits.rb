# Q-17 backtracking
def letter_combinations(digits)
  keys = %w[abc def ghi jkl mno pqrs tuv wxyz].map(&:chars)
  result = []
  backtracking0(digits.chars.map(&:to_i).map { |ch| keys[ch - 2] }, 0, '', result)
  result.reject(&:empty?)
end

def backtracking(keys, step, collected, result)
  return result << collected.join if step == keys.size
  keys[step].each do |ch|
    collected << ch
    backtracking(keys, step + 1, collected, result)
    collected.pop
  end
end

# Faster but less typical
def backtracking0(keys, step, collected, result)
  return result << collected if step == keys.size
  keys[step].each do |ch|
    backtracking0(keys, step + 1, collected + ch, result)
  end
end