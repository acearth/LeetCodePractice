# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    head = tail = nil
    carry = 0
    while l1 || l2 || carry != 0  do
        sum = carry
        if l1
            sum += l1.val
            l1 = l1.next
        end
        if l2
            sum += l2.val
            l2 = l2.next
        end
        carry = sum / 10
        value = sum % 10
        if head == nil
            head = tail = ListNode.new(value)
        else
            tail.next = ListNode.new(value)
            tail = tail.next
        end
    end
    return head
end
