import java.util.HashMap;

public class Copy_List_With_Random_Pointer {
    public RandomListNode copyRandomList(RandomListNode head) {
        HashMap<RandomListNode, RandomListNode> table = new HashMap<>();
        RandomListNode p = head;
        while (p != null) {
            table.put(p, new RandomListNode(p.label));
            p = p.next;
        }
        p = head;
        while (p != null) {
            table.get(p).next = table.get(p.next);
            table.get(p).random = table.get(p.random);
            p = p.next;
        }
        return table.get(head);
    }

    class RandomListNode {
        int label;
        RandomListNode next, random;

        RandomListNode(int x) {
            this.label = x;
        }
    }
}
