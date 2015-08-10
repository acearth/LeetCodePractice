import base.TreeLinkNode;

public class NextRightPointerOfTree_II {
    public void connect(TreeLinkNode root) {
        if (root != null) {
            TreeLinkNode curLevelNode = root;
            curLevelNode.next = null;
            TreeLinkNode nextLevelNode = null;
            TreeLinkNode nextLevalStart = null;
            while (curLevelNode != null) {
                System.out.println(curLevelNode.val);
                if (curLevelNode.left != null) {
                    if (nextLevelNode == null) {
                        nextLevelNode = curLevelNode.left;
                        nextLevalStart = nextLevelNode;
                    } else {
                        nextLevelNode.next = curLevelNode.left;
                        nextLevelNode = nextLevelNode.next;
                    }
                }
                if (curLevelNode.right != null) {
                    if (nextLevelNode == null) {
                        nextLevelNode = curLevelNode.right;
                        nextLevalStart = nextLevelNode;
                    } else {
                        nextLevelNode.next = curLevelNode.right;
                        nextLevelNode = nextLevelNode.next;
                    }
                }
                if (curLevelNode.next == null) {
                    if (nextLevelNode != null) {
                        nextLevelNode.next = null;
                    }
                    curLevelNode = nextLevalStart;
                    nextLevalStart = null; // go to next level
                    nextLevelNode = null;
                } else {
                    curLevelNode = curLevelNode.next;
                }
            }
        }
    }

    public static void main(String[] args) {
        NextRightPointerOfTree_II solution = new NextRightPointerOfTree_II();
        TreeLinkNode t1 = new TreeLinkNode(1);
        TreeLinkNode t2 = new TreeLinkNode(2);
        TreeLinkNode t3 = new TreeLinkNode(3);
        TreeLinkNode t4 = new TreeLinkNode(4);
        TreeLinkNode t5 = new TreeLinkNode(5);
        t1.left = t2;
        t1.right = t3;
        t2.left = t4;
        t2.right = t5;
        solution.connect((t1));
        System.out.println("fine");


    }

}
