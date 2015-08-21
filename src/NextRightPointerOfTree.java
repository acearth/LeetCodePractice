import base.TreeLinkNode;

import java.util.ArrayList;

public class NextRightPointerOfTree {
    public void connect(TreeLinkNode root) {
        if (root == null) {
            return;
        }
        if (root.left == null && root.right == null) {
            root.next=null;
            return;
        }
        ArrayList<TreeLinkNode> q = new ArrayList<>();
        q.add(root);
        while (true) {
            ArrayList<TreeLinkNode> qq = new ArrayList<>();
            while (q.size() > 0) {
                TreeLinkNode tr = q.get(0);
                q.remove(0);
                if (tr.left != null) {
                    qq.add(tr.left);
                }
                if (tr.right != null) {
                    qq.add(tr.right);
                }
            }
            for (int i = 0; i < qq.size() - 1; i++) {
                qq.get(i).next = qq.get(i + 1);
            }
            if (qq.size() > 1) {
                qq.get(qq.size() - 1).next = null;
            }
            if (qq.size() < 1) {
                break;
            }
            q = qq;
        }
    }

    public static void main(String[] args) {
        NextRightPointerOfTree s = new NextRightPointerOfTree();
        TreeLinkNode t1 = new TreeLinkNode(1);
        TreeLinkNode t2 = new TreeLinkNode(2);
        TreeLinkNode t3 = new TreeLinkNode(3);
        t1.left = t2;
        t1.right = t3;
        s.connect(t1);


    }



}
