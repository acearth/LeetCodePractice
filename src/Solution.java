import java.util.ArrayList;

public class Solution {
    public boolean canFinish(int numCourses, int[][] prerequisites) {
        ArrayList<ArrayList<Integer>> graph = new ArrayList<>();
        ArrayList<Integer> visited = new ArrayList<>(numCourses);
        for (int[] cur : prerequisites) {
            graph.get(cur[1]).add(cur[0]);
        }
        for (int i = 0; i < numCourses; i++) {
            if (graph.get(i) != null && visited.get(i) == 0 && !dfs(graph, visited, i)) {
                return false;
            }
        }
        return true;
    }

    public boolean dfs(ArrayList<ArrayList> graph, ArrayList visited, int cur) {
        if (visited.get(cur) == 1) return false;
        visited.add(cur, 1);
        for (int i = 0; i < graph.get(cur).size(); i++) {
            if (!dfs(graph, visited, (Integer) graph.get(cur).get(i))) {
                return false;
            }
        }
        visited.add(cur, 2);
        return true;
    }

}
