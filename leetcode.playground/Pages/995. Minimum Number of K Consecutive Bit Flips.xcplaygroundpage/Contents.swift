//: [Previous](@previous)

/*
 
 995. Minimum Number of K Consecutive Bit Flips
 
 In an array A containing only 0s and 1s, a K-bit flip consists of choosing a (contiguous) subarray of length K and simultaneously changing every 0 in the subarray to 1, and every 1 in the subarray to 0.

 Return the minimum number of K-bit flips required so that there is no 0 in the array.  If it is not possible, return -1.

  

 Example 1:

 Input: A = [0,1,0], K = 1
 Output: 2
 Explanation: Flip A[0], then flip A[2].
 Example 2:

 Input: A = [1,1,0], K = 2
 Output: -1
 Explanation: No matter how we flip subarrays of size 2, we can't make the array become [1,1,1].
 Example 3:

 Input: A = [0,0,0,1,0,1,1,0], K = 3
 Output: 3
 Explanation:
 Flip A[0],A[1],A[2]: A becomes [1,1,1,1,0,1,1,0]
 Flip A[4],A[5],A[6]: A becomes [1,1,1,1,1,0,0,0]
 Flip A[5],A[6],A[7]: A becomes [1,1,1,1,1,1,1,1]
  

 Note:

 1 <= A.length <= 30000
 1 <= K <= A.length
 
 */

/*
 
 class Solution {
     public int minKBitFlips(int[] A, int k) {
         int n = A.length;
         int[] diff = new int[n + 1];
         int revCnt = 0; // 当前位置需要的翻转次数
         int ans = 0;
         for (int i = 0; i < n; i++) {
             revCnt += diff[i];
             // 如果当前位置为0， 并且是当前翻转偶数次的话则还需要翻转一次
             // 如果当前位置为1， 并且是当前翻转奇数次的话则还需要翻转一次
             if ((A[i] + revCnt) % 2 == 0) {
                 if (i + k > n) return -1;
                 revCnt++;
                 ans++;
                 diff[i + k]--; // 区间[i, k - 1]全翻转的一次，影响到了差分数组diff[i + k]
             }
         }
         return ans;
     }
 }
 
 class Solution {
     public int minKBitFlips(int[] A, int K) {
         int n = A.length;
         int revCnt = 0, ans = 0;
         for (int i = 0; i < n; i++) {
             if (i >= K && A[i - K] > 1) {
                 revCnt--;
                 A[i - K] -= 2;
             }
             if ((revCnt + A[i]) % 2 == 0) {
                 if (i + K > n) return -1;
                 revCnt++;
                 ans++;
                 A[i] += 2;
             }
         }
         return ans;
     }
 }
 
 */

class Solution {
    func minKBitFlips(_ A: [Int], _ K: Int) -> Int {
        
        return difArr(A, K)
    }
    
    func difArr(_ A: [Int], _ K: Int) -> Int {
        var arr: [Int] = Array(repeating: 0, count: A.count + 1), cnt = 0, ans = 0
        for i in 0..<A.count {
            let n = A[i]
            cnt += arr[i]
//            if n == 0 && cnt % 2 == 0 {
            if (n + cnt) % 2 == 0 {
                if i + K > A.count {
                    return -1
                }
                cnt += 1
                ans += 1
                arr[i + K] -= 1
                arr[i] += 1
            }
        }
        return ans
    }
}


let A = [0,0,0,1,0,1,1,0], K = 3
let solution = Solution()
let ans = solution.minKBitFlips(A, K)
ans

//: [Next](@next)
