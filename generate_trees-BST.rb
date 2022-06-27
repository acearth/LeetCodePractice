# Q-95 Unique BST II: recursive
def generate_trees(n)
  generate(1, n + 1)
end

def generate(left, right)
  return [nil] unless left < right
  result = []
  (left...right).map do |curr|
    generate(left, curr).each do |left|
      generate(curr + 1, right).each do |right|
        result << TreeNode.new(curr, left, right)
      end
    end
  end
  result
end
