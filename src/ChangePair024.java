/**
 * Created by ace <arthur4it@gmail.com> on 04, 07, 2015.
 */
public class ChangePair024 {
    public ListNode getRev(ListNode head) {
        if (head == null) {
            return null;
        }
        ListNode lh = head;
        ListNode pre, p, l1, l2;
        ListNode head_proto, nextPair;
        if (lh.next == null) {
            return lh;
        } else {
            head_proto = lh.next;
            pre = new ListNode(-1);
            pre.next = head_proto;
            while (lh.next != null) {
                p = lh;
                l1 = p;
                l2 = l1.next;
                nextPair = l2.next;

                pre.next = l2;
                lh = l2;
                lh.next = l1;
                l1.next = nextPair;
                pre = l1;
                lh = nextPair;
                if (lh == null) {
                    break;
                }

            }
            return head_proto;

        }
    }


    public static void main(String[] args) {
        ChangePair024 changePair = new ChangePair024();
        ListNode listNode = new ListNode(1);
        listNode.next = new ListNode(2);
        listNode.next.next = new ListNode(3);
        listNode.next.next.next = new ListNode(4);
        listNode.next.next.next.next = new ListNode(5);
        //ListNode a = changePair.changeInPair(listNode);
        //changePair.changeInPair(listNode);
       ListNode result= changePair.getRev(listNode);

        while (result != null) {
            System.out.println(result.val);
            result = result.next;
        }
    }

}
