def add_two_numbers(l1,l2)
  dummy=result=ListNode.new(0)
  carry=0
  while l1!=nil && l2!=nil
    sum=l1.val+l2.val+carry
    result.next=ListNode.new(sum%10)
    result=result.next
    carry=sum/10
    l1, l2 =l1.next, l2.next
  end
  remain = (l1==nil ? l2 : l1 )
  while remain!=nil
    (result.next=remain;break) if carry==0
    sum = remain.val+carry
    carry = sum/10
    result.next = ListNode.new(sum%10)
    result, remain = result.next, remain.next
  end
  result.next=ListNode.new(1) if carry!=0
  dummy.next
end
