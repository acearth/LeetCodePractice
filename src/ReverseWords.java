public class Solution {
    public String reverseWords(String s) {
        if (s.length() < 1) {
            return s;
        }
        StringBuilder result = new StringBuilder(s.trim());
        result.reverse();
        String[] store = result.toString().split(" +");
        result = new StringBuilder();
        for (String str : store) {
            result.append(new StringBuilder(str).reverse());
        }
        return result.toString();
    }
}
