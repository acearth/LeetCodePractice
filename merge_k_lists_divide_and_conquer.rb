def merge_k_lists(lists)
  return lists[0] if lists.length < 2
  new_len = lists.length / 2 + lists.length % 2
  new_len.times { |k| lists[k] = merge_two_lists(lists[k * 2], lists[k * 2 + 1]) }
  merge_k_lists(lists[0...new_len])
end

def merge_two_lists(list1, list2)
  return list1 || list2 unless list1 && list2
  list1, list2 = list2, list1 if list1.val > list2.val
  list1.next = merge_two_lists(list1.next, list2)
  list1
end
