package base;

/**
 * Created by ace <arthur4it@gmail.com> on 10, 08, 2015.
 */
public class TreeLinkNode {
    public int val;
    public TreeLinkNode left, right, next;

    public TreeLinkNode(int x) {
        val = x;
    }

    public String toString() {
        return String.valueOf(val);
    }
}
