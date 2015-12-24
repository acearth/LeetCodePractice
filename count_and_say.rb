def count(str)
  parts = ['']
  str.chars.each { |ch| ch == parts[-1][-1] ? parts[-1] << ch : parts << ch }
  parts.shift
  parts.map(&:length).zip(parts.map { |s| s[0] }).join
end

def count_and_say(n)
  state="1"
  (n-1).times { state=count(state) }
  state
end

# NOTE: Try to 1) get result recursively and 2) avoid repeated computation
