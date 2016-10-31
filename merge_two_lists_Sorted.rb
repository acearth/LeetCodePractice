def merge_two_lists_recursively(list1, list2)
  return list1 || list2 unless list1 && list2
  list1, list2 = list2, list1 if list1.val > list2.val
  list1.next = merge_two_lists(list1.next, list2)
  list1
end

def merge_two_lists(l1, l2)
  tail = sorted = ListNode.new(0)
  while l1 && l2
    if l1.val < l2.val
      tail.next = l1
      l1 = l1.next
    else
      tail.next = l2
      l2 = l2.next
    end
    tail = tail.next
  end
  l1 = l2 if l2
  tail.next = l1
  sorted.next
end
