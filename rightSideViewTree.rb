def right_side_view(root)

  return [] if root ==nil
  ta=Array.new
  qu=Array.new
  qu.push root
  while true
    tal=Array.new
    que=Array.new
    while qu.size>0
      tr=qu.shift
      que.push tr.left if tr.left!=nil
      que.push tr.right if tr.right !=nil
      tal.push tr.val
    end
    qu=que
    ta.push tal.last
    break if que.size==0
  end
  return ta
end
