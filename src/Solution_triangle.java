import java.util.List;

public class Solution_triangle {
    public int minimumTotal(List<List<Integer>> triangle) {
        int level = triangle.size()-2;
        while (level >= 0) {
            List<Integer> curLevel = triangle.get(level);
            List<Integer> baseLevel = triangle.get(level+1);
            for (int i = 0; i < curLevel.size(); i++) {
                curLevel.set(i, curLevel.get(i) + Math.min(baseLevel.get(i), baseLevel.get(i + 1)));
            }
            level--;
        }
        return triangle.get(0).get(0);
    }
}