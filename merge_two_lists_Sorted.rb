def merge_two_lists(l1,l2)
  return l1 if not l2
  return l2 if not l1
  l1,l2 = l2, l1 if l1.val > l2.val  ## swap 
  l1.next=merge_two_lists(l1.next,l2)
  l1
end
