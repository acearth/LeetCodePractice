/**
 * Created by ace <arthur4it@gmail.com> on 04, 07, 2015.
 */
public class TwoAdds002 {
    public ListNode addTwo(ListNode l1, ListNode l2) {
        ListNode head = new ListNode(-1);
        ListNode curr=head;
        int com = 0;
        while (l1 != null && l2 != null) {
            ListNode p = new ListNode(0);
            int result = l1.val + l2.val + com;
            com = result / 10;
            p.val = result % 10;
            curr.next=p;
            curr = curr.next;
            l1 = l1.next;
            l2 = l2.next;

        }
        while (l1 != null) {
            if (com < 1) {
                curr.next = l1;
                break;
            } else {
                int result = l1.val + com;
                com = result / 10;
                l1.val = result % 10;
                curr.next=l1;
                l1 = l1.next;
                curr=curr.next;
            }
        }
        while (l2 != null) {
            if (com < 1) {
                curr.next = l2;
                break;
            } else {
                int result = l2.val + com;
                com = result / 10;
                l2.val = result % 10;
                curr.next=l2;
                l2 = l2.next;
                curr=curr.next;
            }
        }
        if (com > 0) {
            ListNode p = new ListNode(com);
            curr.next=p;
            curr = curr.next;
        }

        return head.next;
    }

    public static void main(String[] args) {
        TwoAdds002 twoAdds = new TwoAdds002();
        ListNode lb = new ListNode(9);

        ListNode la = new ListNode(1);
        //la.next = new ListNode(8);
        lb.next = new ListNode(9);
        //la.next.next = new ListNode(5);
        //lb.next.next = new ListNode(7);
       ListNode r = twoAdds.addTwo(la, lb);
        while (r != null) {
            System.out.print(r.val + " ");
            r = r.next;
        }
    }
}
