public class Solution {
    // you need to treat n as an unsigned value
    public int hammingWeight(int n) {
        if(n==0) return 0;
        if(n<0) return 1+hammingWeight(Integer.MAX_VALUE+n+1);
        int result=0;
        while(n>0){
            result+=n%2;
            n=n>>1;            
        }
        return result;
    }
}
