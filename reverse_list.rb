def reverse_list(head)
  return if not head
  reverse(head)[0]
end
def reverse(head)
  return [head,head] if head.next==nil
  neo,tail=reverse(head.next)
  head.next=nil
  tail.next=head
  [neo,head]
end
