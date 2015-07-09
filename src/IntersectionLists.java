
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) {
 *         val = x;
 *         next = null;
 *     }
 * }
 */
public class IntersectionLists{
    public ListNode getIntersectionNode(ListNode headA, ListNode headB) {
        if (headB == null || headA == null) {
            return null;
        }
        ListNode p = headA;
        ListNode q;
        int ka = 0;
        int kb = 0;
        while (p != null) {
            p = p.next;
            ka++;
        }
        p = headB;
        while (p != null) {
            p = p.next;
            kb++;
        }
        int d;
        if (ka > kb) {
            d = ka - kb;
            p = headA;
            q=headB;
        } else {
            d = kb - ka;
            p = headB;
            q = headA;
        }
        for (int i = 0; i < d; i++) {
            p = p.next;
        }
        while (p.val != q.val) {
            p = p.next;
            q = q.next;
            if (p == null || q == null) {
                q = null;
                q = null;
                break;
            }
        }
        return p;
    }
}
