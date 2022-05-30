#question 662
# note: We got the definition: root has [1,3000] nodes, so root MUST not null
def width_of_binary_tree(root)
  queue, width = [[root, 0]], 0
  while queue.any?
    width = [width, queue.last[1] - queue.first[1] + 1].max
    queue = queue.each_with_object([]) do |current, next_queue|
      next_queue << [current[0].left, current[1] * 2] if current[0].left
      next_queue << [current[0].right, current[1] * 2 + 1] if current[0].right
    end
  end
  width
end
