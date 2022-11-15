# Q-82: funny
def delete_duplicates(head)
  return head if head==nil ||head.next==nil
  if head.val !=head.next.val
    head.next=delete_duplicates(head.next)
    head
  else
    cur=head.val
    head=head.next while head!=nil && head.val==cur
    delete_duplicates(head)
  end
end

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
def delete_duplicates(head)
    dummy=ListNode.new(0, head)
    pre=dummy
    p = head
    while p
        dup=false
        while p.next && p.val==p.next.val
            dup=true
            p=p.next
        end
        if dup
            p=p.next
        else
            pre.next=p
            pre=p
            p=p.next
        end
    end
    pre.next=p
    dummy.next
    
end
