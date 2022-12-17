# Q-369
# 17/dec/2022
def plus_one(head)
  p = reversed = reverse(head)
  pre = nil
  carry = 1
  while p
    n = p.val + carry
    carry = n / 10
    p.val = n % 10
    pre = p
    p = p.next
  end
  pre.next = ListNode.new(1) if carry == 1
  reverse(reversed)
end

def reverse(list)
  return unless list
  q = list.next
  tail = list
  tail.next = nil
  while q
    node = q.next
    q.next = tail
    tail = q
    q = node
  end
  tail
end
