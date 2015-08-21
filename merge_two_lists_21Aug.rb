def merge_two_lists(l1,l2)
  dummy=ListNode.new(0)
  merged=dummy
  while l1!=nil && l2!=nil
    if l1.val>l2.val
      merged.next=l2
      l2=l2.next
    else
      merged.next=l1
      l1=l1.next
    end
    merged=merged.next
  end
  merged.next=l1 if l2==nil
  merged.next=l2 if l1==nil
  dummy.next
end

