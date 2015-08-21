import java.util.Arrays;

public class FirstMissingPositiveSolution {
    public int firstMissingPositive_n(int[] nums) {
        for (int i : nums) {
            while (i > 0 && i <= nums.length && i != nums[i - 1]) {
                int t = nums[i - 1];
                nums[i - 1] = i;
                i = t;
            }
        }
        for (int i = 0; i < nums.length; i++) {
            if (i + 1 != nums[i]) {
                return i + 1;
            }
        }
        return nums.length + 1;
    }

    //n*n but closed to n
    public int firstMissingPositive(int[] nums) {
        int oldBase = 0;
        int base = 0;
        while (true) {
            for (int i : nums) {
                if (base + 1 == i) {
                    base = i;
                }
            }
            if (base == oldBase) {
                return base + 1;
            }
            oldBase = base;
            for (int i = nums.length - 1; i >= 0; i--) {
                if (base + 1 == nums[i]) {
                    base = nums[i];
                }
            }
            if (base == oldBase) {
                return base + 1;
            }
            oldBase = base;
        }
    }


    public static void main(String[] args) {
        FirstMissingPositiveSolution solution = new FirstMissingPositiveSolution();
        int[] a = {1, 2, 3, 45};
        int[] b = {2, 1};
        int k = solution.firstMissingPositive(a);
        System.out.println(k);
        k = solution.firstMissingPositive(b);
        System.out.println(k);

    }
}

