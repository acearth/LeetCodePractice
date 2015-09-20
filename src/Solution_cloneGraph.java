import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

class UndirectedGraphNode { //TODO: remove
	int label;
	List<UndirectedGraphNode> neighbors;

	UndirectedGraphNode(int x) {
		label = x;
		neighbors = new ArrayList<UndirectedGraphNode>();
	}
}

public class Solution_cloneGraph {
	public UndirectedGraphNode clone(UndirectedGraphNode node, HashMap<Integer, UndirectedGraphNode> occurred) {
		UndirectedGraphNode curNode = occurred.get(node.label);
		if (curNode != null) {
			return curNode;
		} else {
			curNode = new UndirectedGraphNode(node.label);
			occurred.put(node.label, curNode);
			for (UndirectedGraphNode friend : node.neighbors) {
				curNode.neighbors.add(clone(friend, occurred));
			}
			return curNode;
		}
	}

	public UndirectedGraphNode cloneGraph(UndirectedGraphNode node) {
		return node == null ? node : clone(node, new HashMap<>());
	}

	public static void main(String[] args) {
		UndirectedGraphNode n1 = new UndirectedGraphNode(1);
		UndirectedGraphNode n2 = new UndirectedGraphNode(2);
		UndirectedGraphNode n3 = new UndirectedGraphNode(3);
		n1.neighbors.add(n2);
		n1.neighbors.add(n3);
		n2.neighbors.add(n1);
		n2.neighbors.add(n3);
		n3.neighbors.add(n1);
		n3.neighbors.add(n2);
		n3.neighbors.add(n3);

		System.out.println("Showed");
		Solution_cloneGraph solution = new Solution_cloneGraph();
		UndirectedGraphNode copy = solution.cloneGraph(n1);
		System.out.println("Copyed");

	}
}
