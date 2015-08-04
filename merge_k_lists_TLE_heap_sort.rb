require './base/ListNode'
##solved by heap sort, but TLE
def merge_k_lists(lists)
  createHeap(lists)
  return nil if lists.size==0
  return lists[0] if lists.size==1
  head=lists[0]
  head.next=nil
  curTail=head
  lists[0]=lists[0].next
  createHeap(lists)
  while lists.size>0
    curTail.next=lists[0]
    curTail=lists[0]
    lists[0]=lists[0].next
    curTail.next=nil
    lists[0],lists[-1]=lists[-1],lists[0] if lists.size>1
    lists.clear if lists.size==1
    createHeap(lists)
  end
  head
end
def createHeap(lists)
  lists.delete nil if lists.include? nil
  ((lists.size-1)/2).downto(0) do |i|
    heapify(lists,i)
  end
end

def heapify(heap,i)
  return if heap.size<2*(i+1)
  min=2*(i+1)-1
  min=(i+1)*2 if heap[min+1]!=nil &&heap[min+1].val<heap[min].val
  heap[i],heap[min]=heap[min],heap[i] if heap[i].val>heap[min].val
end
l1=ListNode.new(1)
l2=ListNode.new(0)
p merge_k_lists([l1,l2])
[[-1,1],[-3,1,4],[-2,-1,0,2]]
l1=ListNode.new(-1)
l2=ListNode.new(1)
j1=ListNode.new(-3)
j2=ListNode.new(1)
j3=ListNode.new(4)
k1,k2,k3,k4=ListNode.new(-2),ListNode.new(-1),ListNode.new(0),ListNode.new(2)
l1.next=l2
j1.next=j2
j2.next=j3
k1.next=k2
k2.next=k3
k3.next=k4
merge_k_lists([l1,j1,k1]).tranverse

