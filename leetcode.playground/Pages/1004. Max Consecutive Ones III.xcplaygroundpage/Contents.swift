//: [Previous](@previous)

/*
 
 1004. Max Consecutive Ones III
 
 Given an array A of 0s and 1s, we may change up to K values from 0 to 1.

 Return the length of the longest (contiguous) subarray that contains only 1s.

  

 Example 1:

 Input: A = [1,1,1,0,0,0,1,1,1,1,0], K = 2
 Output: 6
 Explanation:
 [1,1,1,0,0,1,1,1,1,1,1]
 Bolded numbers were flipped from 0 to 1.  The longest subarray is underlined.
 Example 2:

 Input: A = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], K = 3
 Output: 10
 Explanation:
 [0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
 Bolded numbers were flipped from 0 to 1.  The longest subarray is underlined.
  

 Note:

 1 <= A.length <= 20000
 0 <= K <= A.length
 A[i] is 0 or 1
 
 */

/*
 class Solution {
     public int longestOnes(int[] A, int K) {
         int l = 0, r = 0, res = 0;
         while (r < A.length) {
             if (A[r] == 0) {
                 if (K == 0) {
                     while (A[l] == 1) l++;
                     l++;
                 } else {
                     K--;
                 }
             }
             res = Math.max(res, ++r - l);
         }
         return res;
     }
 }
 */

class Solution {
    func longestOnes(_ A: [Int], _ K: Int) -> Int {
        var left = 0, right = 0, ans = 0, K = K
        while right < A.count {
            if A[right] == 0 {
                if K == 0 {
                    while A[left] == 1 {
                        left += 1
                    }
                    left += 1
                } else {
                    K -= 1
                }
            }
            right += 1
            ans = max(ans, right - left)
        }
        
        return ans
    }
    
    /* func longestOnes(_ A: [Int], _ K: Int) -> Int {
        var left = 0, right = 0, ans = 0, pos: [Int] = []
        while right < A.count {
            if A[right] == 1 {
                right += 1
            } else if pos.count < K {
                right += 1
                pos.append(right)
            } else {
                ans = max(ans, right - left)
                if K == 0 {
                    right += 1
                    left = right
                } else {
                    left = pos.removeFirst()
                }
            }
        }
        ans = max(ans, right - left)
        return ans
    }
 */
}

//let A = [0,0,0,1], K = 4
//let A = [0,0,1,1,1,0,0], K = 0
//let A = [1,1,1,0,0,0,1,1,1,1,0], K = 2
let A = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], K = 3
let solution = Solution()
let ans = solution.longestOnes(A, K)
ans

//: [Next](@next)
