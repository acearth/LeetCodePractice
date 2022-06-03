# q-142: reasoning!
def detect_cycle(head)
  p = fast = head
  while fast && fast.next
    p = p.next
    fast = fast.next.next
    if p == fast
      # reasoning: why distance from head to fast is the entrance of cycle
      head, fast = head.next, fast.next while head != fast
      return head
    end
  end
  nil
end

# direct and slow way (with set contains check)
def detectCycle(head)
  # two dummy head
  p = q = r = dummy = ListNode.new(0, ListNode.new(0, head))
  while q && q.next # note: if head is nil, the condition will not be triggered when we don't have two dummy head
    p = p.next
    q = q.next.next
    break if p == q
  end
  return unless p == q
  cycle = [p]
  p = p.next
  while p != q
    cycle << p
    p = p.next
  end
  while r
    return r if cycle.include? r
    r = r.next
  end
end