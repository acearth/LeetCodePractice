def find_mode(root)
  stack, pre, count, max_count, result = [], nil, 0, 0, []
  while root || stack.any?
    while root
      stack << root
      root = root.left
    end
    root = stack.pop
    if pre && pre.val == root.val
      count += 1
    else
      count = 1
    end
    if max_count < count
      max_count = count
      result = [root.val]
    elsif max_count == count
      result << root.val
    end
    pre = root
    root = root.right
  end
  result
end

# Q-501: recursive way is bad, hard to bring reference in recursive-body
def find_mode_recur(root)
  @result, @count, @max_count, @pre = [], 0, 0, nil
  search(root, nil)
  @result
end

def search(root, pre)
  return unless root
  search(root.left, pre)
  if @pre && @pre.val == root.val
    @count += 1
  else
    @count = 1
  end
  if @count > @max_count
    @result = [root.val]
    @max_count = @count
  elsif @count == @max_count
    @result << root.val
  end
  @pre = root
  search(root.right, pre)
end