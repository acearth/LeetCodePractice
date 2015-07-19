/**
 * Definition for singly-linked list.
 * class ListNode {
 * int val;
 * ListNode next;
 * ListNode(int x) {
 * val = x;
 * next = null;
 * }
 * }
 */
public class SolutionForCyclicListDetect {
    public ListNode detectCycle(ListNode head) {
        if (head == null || head.next == null) {
            return null;
        }
        ListNode p = head;
        ListNode pp = head;
        int breakTag = 0;
        while (p.next != null) {
            if (pp.next == null) {
                break;
            }
            p = p.next;
            pp = pp.next.next;
            if (pp == null) {
                break;
            }
            if (p.equals(pp)) {
                breakTag = 1;
                break;
            }
        }
        if (breakTag == 0) {
            return null;
        }
        p = head;
        while (true) {
            p = p.next;
            if (pp.next.next.equals(pp)) {
                p = p.next;
                if (p.next.next.equals(p)) {
                    break;
                }
            }
            pp = pp.next;
            if (p.equals(pp)) {
                break;
            }
        }
        return p;
    }

    public static void main(String[] args) {
        ListNode l1 = new ListNode(3);
        ListNode l2 = new ListNode(2);
        ListNode l3 = new ListNode(0);
        ListNode l4 = new ListNode(-4);
        l1.next = l2;
        l2.next = l3;
        l3.next = l4;
        l4.next = l2;
        SolutionForCyclicListDetect s = new SolutionForCyclicListDetect();
        System.out.println(s.detectCycle(l1));
    }
}
