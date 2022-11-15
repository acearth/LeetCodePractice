def cut(list, len)
  while list && len > 1
    list = list.next
    len -= 1
  end
  return unless len == 1 && list
  tail = list.next
  list.next = nil
  tail
end

def merge(l1, l2)
  tail = got = ListNode.new(0)
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
  tail.next = l1 ? l1 : l2
  tail = tail.next while tail.next
  [got.next, tail]
end

def sort_list(head)
  tail = sorted = ListNode.new(0)
  step = 1
  loop do
    loop_count = 0
    while head
      list1, list2 = head, cut(head, step)
      head = list2 ? cut(list2, step) : nil
      part_head, part_tail = merge(list1, list2)
      tail.next = part_head
      tail = part_tail
      loop_count += 1
    end
    break if loop_count < 2
    tail, head = sorted, sorted.next
    step *= 2
  end
  sorted.next
end



# Q-148: exercise at 14/nov/2022
#  Still need to improve by fast and slow pointers
#
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def sort_list(head)
  dummy = ListNode.new(-1 * 2 ** 32, head)
  pre = p = dummy
  intv = 1
  need = true
  while need
    pass = 0
    while p
      first = p
      tail = nil
      intv.times { tail = p; break unless p; p = p.next }
      need = false if pass == 0 && !tail.next
      break unless tail.next
      pass += 1
      sorted, tail, remained = merge(first, tail, intv)
      pre.next = sorted
      pre = tail
      p = remained
    end
    intv *= 2
  end
end

def merge(list, another, size)
  tail = head = list.val >= another.val ? another.val : list
  if head == another
    another = another.next
    size -= 1
  else
    list = list.next
  end
  while list || another && size > 0
    if list && list.val <= another.val
      tail.next = list
      list = list.next
    else
      tail.next = another
      another = another.next
      size -= 1
    end
    tail = tail.next
  end
  tail.next = nil
  [head, tail, another]
end