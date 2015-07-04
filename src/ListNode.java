/**
 * Created by ace <arthur4it@gmail.com> on 04, 07, 2015.
 */
public class ListNode {
    int val;
    ListNode next;

    public ListNode(int val) {

        this.val = val;
    }
    public String toString() {
        String nextInfo = new String();
        if (next != null) {
            nextInfo += next.val;
        } else nextInfo += "null";
        return val + " :|-> "+nextInfo;
    }
}
